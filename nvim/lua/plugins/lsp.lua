return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "config.lsp"
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
