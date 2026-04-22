return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- version = "*",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "cue",
        "diff",
        "dockerfile",
        "editorconfig",
        "html",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "graphql",
        "hcl",
        "html",
        "ini",
        "javascript",
        "json",
        "jsonnet",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "ruby",
        "rust",
        "sql",
        "starlark",
        "terraform",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zsh",
      },
      autotag = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = {
        enable = false,
        disable = {},
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
    init = function()
      require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
        local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
        local filename = vim.fn.fnamemodify(filepath, ":t")
        return string.match(filename, ".*mise.*%.toml$") ~= nil
      end, { force = true, all = false })
    end,
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      -- auto install
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("tree-sitter-auto", { clear = true }),
        callback = function(args)
          local treesitter = require "nvim-treesitter"
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end
          if
            vim.list_contains(opts.ensure_installed, lang) and not vim.list_contains(treesitter.get_installed(), lang)
          then
            treesitter.install(lang)
          end

          if vim.treesitter.query.get(lang, "highlights") then
            vim.treesitter.start(args.buf)
          end

          if vim.treesitter.query.get(lang, "indents") then
            vim.opt_local.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          end

          if vim.treesitter.query.get(lang, "folds") then
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })

      vim.api.nvim_create_user_command("TreesitterInstallParsers", function()
        local treesitter = require("nvim-treesitter")
        vim.notify(string.format("Installing %d parsers...", #opts.ensure_installed), vim.log.levels.INFO)
        treesitter.install(opts.ensure_installed, { summary = true })
      end, {})

      -- old pre-main config
      -- require("nvim-treesitter.configs").setup(opts)
      --
      -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- parser_config.gotmpl = {
      --   install_info = {
      --     url = "https://github.com/ngalaiko/tree-sitter-go-template",
      --     files = { "src/parser.c" },
      --   },
      --   filetype = "gotmpl",
      --   used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
      -- }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    version = false,
    opts = {
      enable = true,
      throttle = true,
      max_lines = 0,
      patterns = {
        default = {
          "class",
          "function",
          "method",
        },
      },
    },
  },

  { "nvim-treesitter/nvim-treesitter-textobjects", version = false },
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-endwise",
}
