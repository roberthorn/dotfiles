return {
  {
    "williamboman/mason.nvim",
    version = "*",
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local noremap_silent_opts = { noremap = true, silent = true }
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, noremap_silent_opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, noremap_silent_opts)
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, noremap_silent_opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, noremap_silent_opts)

      local on_attach = function(_, bufnr)
        local function nmap(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gR", vim.lsp.buf.references, "[G]oto [R]eferences")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- see `:help K`
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>f", vim.lsp.buf.formatting, "[F]ormat")
      end

      require("neodev").setup()

      local lspconfig = require "lspconfig"

      local capabilites = vim.lsp.protocol.make_client_capabilities()
      capabilites = require("cmp_nvim_lsp").default_capabilities(capabilites)

      local servers = {
        eslint = {
          on_attach = on_attach,
        },
        gopls = {
          on_attach = on_attach,
          capabilites = capabilites,
          root_dir = function(fname)
            local util = require "lspconfig.util"
            -- see: https://github.com/neovim/nvim-lspconfig/issues/804
            -- see: https://github.com/neovim/nvim-lspconfig/issues/2733
            local mod_cache = vim.trim(vim.fn.system "go env GOMODCACHE")
            if fname:sub(1, #mod_cache) == mod_cache then
              local clients = vim.lsp.get_active_clients { name = "gopls" }
              if #clients > 0 then
                return clients[#clients].config.root_dir
              end
            end
            return util.root_pattern "go.work"(fname) or util.root_pattern("go.mod", ".git")(fname)
          end,
        },
        html = {
          on_attach = on_attach,
          capabilites = capabilites,
        },
        lua_ls = {
          on_attach = on_attach,
          capabilites = capabilites,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "use" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            },
          },
        },
        tsserver = {
          capabilites = capabilites,
          on_attach = on_attach,
          filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
        },
      }

      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
          },
        },
      }
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      for server, c in pairs(servers) do
        lspconfig[server].setup(c)
      end
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    opts = {},
  },
}
