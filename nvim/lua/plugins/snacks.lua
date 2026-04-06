local version = vim.version()
local version_str = string.format("NVIM v%s.%s.%s", version.major, version.minor, version.patch)
if version.api_prerelease then
  version_str = string.format("%s-dev+%s", version_str, version.build)
end

local fmt_logo = function(s1, s2)
  return {
    align = "center",
    text = {
      { s1, hl = "Special" },
      { s2, hl = "String" },
    },
  }
end

local linebreak = function()
  return { align = "center", text = "" }
end

local sep = function()
  local str = string.rep("─", 60)
  return { align = "center", text = { str, hl = "NonText" } }
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        preset = {
          pick = nil,
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = function()
                require("telescope.builtin").find_files(require("telescope.themes").get_ivy {})
              end,
            },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = function()
                require("telescope").extensions.live_grep_args.live_grep_args()
              end,
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = function()
                require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy {})
              end,
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        -- item field formatters
        formats = {
          icon = function(item)
            if item.file and item.icon == "file" or item.icon == "directory" then
              return Snacks.dashboard.icon(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match "^(.*)/(.+)$"
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
          end,
        },
        sections = {
          {
            fmt_logo("│ ", "╲ ││"),
            fmt_logo("││", "╲╲││"),
            fmt_logo("││", " ╲ │"),
            linebreak(),
            { align = "center", text = { "|\\| [- () \\/ | |\\/|", hl = "SnacksDashboardHeader" } },
            linebreak(),
            { align = "center", text = { version_str, hl = "String" } },
          },
          sep(),
          { section = "keys", gap = 1, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      indent = {
        animate = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },
}
