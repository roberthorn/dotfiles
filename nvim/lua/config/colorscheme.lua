return {
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          lightspeed = true,
        },
      }
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
