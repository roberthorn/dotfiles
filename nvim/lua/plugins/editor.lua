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
    commit = "73540cb",
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

  -- completions
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    version = "*",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config {
        virtual_text = false,
        signs = {
          active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          -- focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      luasnip.config.setup {}
      -- require('luasnip.loaders.from_vscode').lazy_load()

      vim.o.completeopt = "menu,menuone,noselect"

      cmp.setup {
        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
        },
        formatting = {
          format = lspkind.cmp_format { mode = "symbol_text", max_width = 50, ellipsis_char = "..." },
        },
      }

      -- auto-add () for functions/methods
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
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
}
