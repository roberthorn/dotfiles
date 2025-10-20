return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}

      local nmap = require("rh.keymap").nmap

      nmap { "<C-n>", require("nvim-tree.api").tree.toggle }
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "catppuccin",
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    },
  },

  {
    "akinsho/bufferline.nvim",
    -- * is broken in 0.10, see https://github.com/akinsho/bufferline.nvim/issues/903
    -- version = "*",
    lazy = false,
    keys = {
      { "<leader>bp", "<CMD>BufferLineTogglePin<CR>", desc = "Toggle Buffer Pin" },
      { "<leader>bP", "<CMD>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    },
    opts = {
      highlights = {
        fill = {},
        background = {},
        tab_selected = {},
        buffer_selected = { italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
      },

      options = {
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        -- numbers = "ordinal",
        max_name_length = 15,
        max_prefix_length = 6,
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = true,
        diagnostics_indicator = function(count, level)
          local icon = level:match "error" and "" or ""
          return icon .. count
        end,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          jsx = { "prettier" },
          typescript = { "prettier" },
        },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format { bufnr = args.buf }
        end,
      })
    end,
  },

  {
    "ggandor/leap.nvim",
    version = "*",
    opts = {
      highlight_unlabeled_phase_one_targets = true,
    },
    config = function(_, opts)
      local leap = require "leap"
      leap.setup(opts)
      leap.create_default_mappings()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {
      keymaps = {
        -- TODO: set these to something else, these cause an annoying delay
        -- visual = "ys",
        -- visual_line = "yS",
      },
    },
  },

  {
    "utilyre/barbecue.nvim",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  --[[ {
    "declancm/cinnamon.nvim",
    version = "*",
    opts = {},
  }, ]]

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    version = "*",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = function()
      local config = require("ibl.config").default_config
      config.indent.tab_char = config.indent.char
      config.scope.enabled = false
      require("ibl").setup(config)
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    keys = {
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },

  {
    "echasnovski/mini.pairs",
    version = "*",
    opts = {},
  },

  {
    "mghaight/replua.nvim",
    config = function()
      require("replua").setup()
    end,
  },
}
