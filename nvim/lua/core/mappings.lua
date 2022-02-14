-- leader
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', {})
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<cr>', { silent = true })
