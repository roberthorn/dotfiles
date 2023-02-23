local execute = vim.api.nvim_command
local fn = vim.fn

-- bootstrap
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local packer = require('packer')

return packer.startup({function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Appearance
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-lualine/lualine.nvim', config = require('plugin.lualine') }
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- LSP, completions, & snippets
  use { 'neovim/nvim-lspconfig', config = require('plugin.lspconfig'), requires = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/neodev.nvim' },
  }}

  use { 'hrsh7th/nvim-cmp', config = require('plugin.nvim-cmp'), requires = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'onsails/lspkind-nvim' },
  }}

  use { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp', requires = {
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
  }}

  use { 'kyazdani42/nvim-tree.lua', config = require('plugin.nvim-tree') }

  -- Treesitter and TS-plugins
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", config = require('plugin.treesitter') }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'windwp/nvim-ts-autotag'
  use 'RRethy/nvim-treesitter-endwise'
  use { 'romgrk/nvim-treesitter-context', config = require('plugin.ts-context') }
  use { 'windwp/nvim-autopairs', config = require('plugin.nvim-autopairs') }

  -- Search
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = require('plugin.telescope') }
  use { 'nvim-telescope/telescope-fzf-native.nvim', requires = 'nvim-telescope/telescope.nvim', run = 'make' }

  -- Editting
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'ggandor/lightspeed.nvim'
  use { 'karb94/neoscroll.nvim', config = require('plugin.neoscroll') }

  -- Git
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', config = require('plugin.gitsigns') }

  -- Go
  use { 'fatih/vim-go', config = require('plugin.go') }

  if packer_bootstrap then
    packer.sync()
  end
end,
config = {
  display = {
    open_fn = function ()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
