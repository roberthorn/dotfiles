return function()
	--nnoremap <C-f> :FZF
	--nnoremap <Leader>; :Buffers<CR>
	--nnoremap <Leader>f :Files<CR>
	--nnoremap <Leader>t :Tags<CR>
	vim.api.nvim_set_keymap('n', '<C-f>', ':Files<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<Leader>;', ':Buffers<cr>', { noremap = true })
	--vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<Leader>t', ':Tags<cr>', { noremap = true })
end
