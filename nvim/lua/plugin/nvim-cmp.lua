return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  -- BUG: mappings just escapes, breaks tabbing
  --[[
  local snip_opts = {
    expr = true,
    silent = true
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  _G.snippet_tab_next = function()
    return vim.fn['vsnip#jumpable(1)'] and t'<Plug>(vsnip-jump-next)' or t'<Tab>'
  end

  _G.snippet_tab_prev = function()
    return vim.fn['vsnip#jumpable(-1)'] and t'<Plug>(vsnip-jump-prev)' or t'<S-Tab>'
  end

  vim.o.completeopt = "menu,menuone,noselect"
  vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.snippet_tab_next()', snip_opts)
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.snippet_tab_prev()', snip_opts)
  vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.snippet_tab_next()', snip_opts)
  vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.snippet_tab_prev()', snip_opts)
  --]]

  vim.o.completeopt = "menu,menuone,noselect"
  vim.cmd[[
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  ]]

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn['vsnip#available'](1) == 1 then
          feedkey('<Plug>(vsnip-expand-or-jump)', '')
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn['vsnip#jumpable'](-1) == 1 then
          feedkey('<Plug>(vsnip-jump-prev)', '')
        end
      end, { 'i', 's' }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' }
    },
    formatting = {
      format = lspkind.cmp_format({ with_text = false, max_width = 50 })
    }
  })
end
