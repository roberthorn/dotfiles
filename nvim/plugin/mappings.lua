vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
