local nmap = require("rh.keymap").nmap
local noremap_silent_opts = { noremap = true, silent = true }

nmap { "[d", vim.diagnostic.goto_prev, noremap_silent_opts }
nmap { "]d", vim.diagnostic.goto_next, noremap_silent_opts }
nmap { "<space>e", vim.diagnostic.open_float, noremap_silent_opts }
nmap { "<space>q", vim.diagnostic.setloclist, noremap_silent_opts }

local on_attach = function(_, bufnr)
  local function buf_nmap(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    nmap { keys, func, { buffer = bufnr, desc = desc } }
  end

  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

  buf_nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  buf_nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  buf_nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  buf_nmap("gr", function()
    require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy {})
  end, "[G]oto [R]eferences")
  buf_nmap("gR", vim.lsp.buf.references, "[G]oto [R]eferences")
  buf_nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  buf_nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  buf_nmap("<leader>ds", function()
    require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_ivy {})
  end, "[D]ocument [S]ymbols")
  buf_nmap("<leader>ws", function()
    require("telescope.builtin").lsp_dynamic_workspace_symbols(require("telescope.themes").get_ivy {})
  end, "[W]orkspace [S]ymbols")

  -- see `:help K`
  buf_nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  buf_nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  buf_nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  buf_nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  buf_nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")
  buf_nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  buf_nmap("<leader>f", function()
    vim.lsp.buf.format { async = true }
  end, "[F]ormat")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

local servers = {
  cssls = {
    filetypes = { "css", "less", "scss" },
  },
  eslint = true,
  gopls = true,
  html = true,
  lua_ls = {
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
  marksman = true,
  pyright = true,
  rust_analyzer = true,
  ts_ls = {
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
  automatic_installation = false,
  automatic_enable = false,
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
  }, config)

  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end
