local M = {}

M.jump_last_pos = function()
  if vim.bo.buftype == "" and vim.fn.index({ "diff", "gitcommit" }, vim.bo.filetype, 0, true) == -1 then
    if vim.fn.line "'\"" >= 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.cmd 'normal! g`"zz'
    end
  end
end

return M
