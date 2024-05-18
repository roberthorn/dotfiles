autocmd BufNewFile,BufRead *.yaml if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl ts=2 sts=2 sw=2 expandtab | endif
