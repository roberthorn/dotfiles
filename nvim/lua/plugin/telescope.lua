return function()
  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  })

  require('telescope').load_extension('fzf')

  vim.api.nvim_set_keymap('n', '<Leader>;', ':Telescope buffers<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>g', ':Telescope live_grep<cr>', { noremap = true })
end
