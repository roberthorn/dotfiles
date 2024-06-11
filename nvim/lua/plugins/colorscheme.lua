return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          lightspeed = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      }
      vim.opt.background = "dark"
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
