return {
  {
    "nvim-lua/plenary.nvim",
    version = false,
  },
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
    dependencies = {},
    opts = {
      options = {
        icons_enabled = true,
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
          go = { "golangci-lint" },
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
    url = "https://codeberg.org/andyg/leap.nvim.git",
    version = "*",
    lazy = false,
    opts = {
      highlight_unlabeled_phase_one_targets = true,
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end

      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
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
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
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

  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    opts = {
      use_git_branch = true,
    },
    config = function(_, opts)
      require("persisted").setup(opts)

      vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

      -- save current session before swap
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistedTelescopeLoadPre",
        callback = function(session)
          -- Save the currently loaded session passing in the path to the current session
          require("persisted").save { session = vim.g.persisted_loaded_session }

          -- Delete all of the open buffers
          vim.api.nvim_input "<ESC>:%bd!<CR>"
        end,
      })
    end,
  },
}
