-- leader, should be as early as possible for mappings to use correct leader
-- TODO: use localleader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- disable builtins
require "rh.disable_builtin"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  defaults = {
    lazy = false,
    version = "*",
  },
  install = { colorscheme = { "catppuccin" } },
})
