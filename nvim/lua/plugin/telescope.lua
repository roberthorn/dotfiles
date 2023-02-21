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

  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
end
