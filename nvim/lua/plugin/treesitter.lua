return function()
  require('nvim-treesitter.configs').setup {
    autotag = {
      enable = true,
    },
    endwise = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = {}
    },
    indent = {
      enable = false,
      disable = {}
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    ensure_installed = {
      "css",
      "go",
      "gomod",
      "html",
      "javascript",
      "json",
      "lua",
      "tsx",
      "typescript",
      "yaml"
    }
  }
end
