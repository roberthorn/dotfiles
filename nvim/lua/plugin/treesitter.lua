return function()
	require('nvim-treesitter.configs').setup {
		highlight = {
			enable = true,
			disable = {}
		},
		indent = {
			enable = false,
			disable = {}
		},
		ensure_installed = {
			"css",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"typescript",
			"yaml"
		}
	}
end
