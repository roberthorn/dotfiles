return function()
  require('nvim-tree').setup {}

  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', { noremap = true })
end
