return function()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "✓"
      }
    }
  }
  require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls" }
  }

  local lspconfig = require("lspconfig")

  local noremap_silent_opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', noremap_silent_opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', noremap_silent_opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', noremap_silent_opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', noremap_silent_opts)

  local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', noremap_silent_opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', noremap_silent_opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap_silent_opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', noremap_silent_opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', noremap_silent_opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', noremap_silent_opts)
  end

  local capabilites = require('cmp_nvim_lsp').default_capabilities()

  local config = {
    ["ansiblels"] = {
      on_attach = on_attach
    },
    ["eslint"] = {
      on_attach = on_attach
    },
    ["gopls"] = {
      on_attach = on_attach,
      capabilites = capabilites
    },
    ["html"] = {
      on_attach = on_attach,
      capabilites = capabilites
    },
    ["lua_ls"] = {
      on_attach = on_attach,
      capabilites = capabilites,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          }
        }
      }
    },
    ["tsserver"] = {
      capabilites = capabilites,
      on_attach = on_attach,
      filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" }
    }
  }

  for server, c in pairs(config) do
    lspconfig[server].setup(c)
  end
end

