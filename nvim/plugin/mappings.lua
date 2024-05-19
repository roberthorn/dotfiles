local nmap = require("rh.keymap").nmap
nmap { "<C-j>", ":wincmd j<cr>", { silent = true } }
nmap { "<C-k>", ":wincmd k<cr>", { silent = true } }
nmap { "<C-h>", ":wincmd h<cr>", { silent = true } }
nmap { "<C-l>", ":wincmd l<cr>", { silent = true } }

-- Remap for dealing with word wrap
nmap { "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } }
nmap { "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } }
