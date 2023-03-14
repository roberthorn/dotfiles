return function ()
  vim.o.sessionoptions = 'buffers,curdir,folds,globals,tabpages,winpos,winsize'

  require('persisted').setup {
    autosave = false,
    autoload = false,
    should_autosave = function ()
      if vim.bo.filetype == 'gitcommit' then
        return false
      end
      return true
    end
  }

  require('telescope').load_extension('persisted')
end
