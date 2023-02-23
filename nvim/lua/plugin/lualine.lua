return function()
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      globalstatus = true
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'filetype' },
      lualine_y = { 'location' },
      lualine_z = { 'progress' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })
end
