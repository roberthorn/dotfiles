local set = vim.opt

set.encoding = "utf-8"
set.path:append "**"
set.number = true
set.relativenumber = true
set.autoread = true
set.mouse = "a"
set.history = 1000
set.backspace = { "indent", "eol", "start" }
set.list = true
--set.listchars = { tab = "»·", trail = "·" }
set.splitbelow = true
set.splitright = true
set.wrap = true
set.linebreak = true
set.breakindent = true
set.ignorecase = true
set.smartcase = true
set.inccommand = "split"
set.conceallevel = 0

-- indents
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- swaps/backups
set.swapfile = false
set.backup = false
set.wb = false

-- scrolling
set.scrolloff = 8
set.sidescrolloff = 10
set.sidescroll = 1

-- clipboard
set.clipboard = "unnamed"

vim.cmd.syntax "on"

if vim.fn.has("termguicolors" == 1) then
  set.termguicolors = true
end
