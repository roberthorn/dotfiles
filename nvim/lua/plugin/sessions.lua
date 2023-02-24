return function ()
  vim.o.sessionoptions = 'buffers,curdir,folds,globals,tabpages,winpos,winsize'

  require('persisted').setup {
    autoload = true
  }

  require('telescope').load_extension('persisted')
end
