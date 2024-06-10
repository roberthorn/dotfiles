-- Jump to last position
-- vim.cmd [[
--  autocmd BufReadPost *
--    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
--    \   exe "normal g`\"" |
--    \ endif
--]]
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "?*",
  group = vim.api.nvim_create_augroup("JumpLastPosition", { clear = true }),
  callback = function()
    local jump = require "rh.jump"
    jump.jump_last_pos()
  end,
})

-- automatically resize windows when terminal resizes
-- TODO: convert to lua
vim.cmd [[
  autocmd VimResized * :wincmd =
]]
