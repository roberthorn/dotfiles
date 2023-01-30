return function()
  -- gopls is reaaaaally slow on save
  -- following issues:
  -- https://github.com/fatih/vim-go/issues/3286
  -- https://github.com/golang/go/issues/45363
  vim.g.go_fmt_command='goimports'
end
