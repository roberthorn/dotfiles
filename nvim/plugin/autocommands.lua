-- Jump to last position
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "?*",
  group = vim.api.nvim_create_augroup("JumpLastPosition", { clear = true }),
  callback = function()
    local jump = require "rh.jump"
    jump.jump_last_pos()
  end,
})

-- automatically resize windows when terminal resizes
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  callback = function()
    vim.cmd "wincmd ="
  end,
})

-- dynamically use treesitter folds if we have a parser
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("TreesitterFolds", { clear = true }),
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang and pcall(vim.treesitter.language.inspect, lang) then
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  end,
})
