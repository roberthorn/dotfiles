local M = {}

local ns = vim.api.nvim_create_namespace "claude-review"

local severity_map = {
  ERROR = vim.diagnostic.severity.ERROR,
  WARN = vim.diagnostic.severity.WARN,
  INFO = vim.diagnostic.severity.INFO,
  HINT = vim.diagnostic.severity.HINT,
}

function M.review()
  vim.diagnostic.reset(ns)

  -- TODO: make async to handle large diffs better
  local diff = vim.fn.system "git diff HEAD"
  if vim.v.shell_error ~= 0 or diff == "" then
    vim.notify("No changes to review", vim.log.levels.INFO)
    return
  end

  local prompt = "You are a code reviewer. Review this git diff and find bugs, issues, or improvements.\n\n"
    .. "Output ONLY a JSON array. Each element must have:\n"
    .. '- "file": relative file path\n'
    .. '- "lnum": 1-based line number in the new version of the file\n'
    .. '- "severity": "ERROR", "WARN", "INFO", or "HINT"\n'
    .. '- "message": concise description of the issue\n\n'
    .. "Focus on the changed lines. If no issues found, output [].\n"
    .. "No markdown fences, no explanation, ONLY the JSON array.\n\n"
    .. diff

  vim.notify("Running Claude code review...", vim.log.levels.INFO)

  local stdout_chunks = {}

  vim.fn.jobstart({ "claude", "-p", prompt, "--output-format", "text" }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          table.insert(stdout_chunks, line)
        end
      end
    end,
    on_exit = function(_, exit_code)
      vim.schedule(function()
        if exit_code ~= 0 then
          vim.notify("Claude review failed (exit " .. exit_code .. ")", vim.log.levels.ERROR)
          return
        end

        local raw = table.concat(stdout_chunks, "\n")
        -- Strip markdown fences if Claude wraps them despite instructions
        raw = raw:gsub("^```json%s*\n?", ""):gsub("\n?```%s*$", "")

        local ok, issues = pcall(vim.json.decode, raw)
        if not ok or type(issues) ~= "table" then
          vim.notify("Failed to parse review output:\n" .. raw:sub(1, 200), vim.log.levels.ERROR)
          return
        end

        local by_file = {}
        for _, issue in ipairs(issues) do
          local file = issue.file
          if not by_file[file] then
            by_file[file] = {}
          end
          table.insert(by_file[file], {
            lnum = (issue.lnum or 1) - 1, -- convert to 0-indexed
            col = 0,
            severity = severity_map[issue.severity] or vim.diagnostic.severity.WARN,
            message = issue.message,
            source = "claude-review",
          })
        end

        local total = 0
        for file, diagnostics in pairs(by_file) do
          local bufnr = vim.fn.bufnr(file)
          if bufnr == -1 then
            bufnr = vim.fn.bufnr(vim.fn.fnamemodify(file, ":p"))
          end
          if bufnr ~= -1 then
            vim.diagnostic.set(ns, bufnr, diagnostics)
            total = total + #diagnostics
          end
        end

        vim.notify(string.format("Claude review complete: %d issues found", total), vim.log.levels.INFO)
      end)
    end,
  })
end

return {
  name = "claude-review",
  dir = vim.fn.stdpath "config",
  init = function(_)
    vim.keymap.set("n", "<leader>cr", M.review, { desc = "Claude code review", noremap = true, silent = true })
  end,
}
