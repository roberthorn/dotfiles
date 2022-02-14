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

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		mapping = {
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
