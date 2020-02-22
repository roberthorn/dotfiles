filetype off

set encoding=utf-8

set number
set relativenumber
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set visualbell
set autoread
set mouse=a
set hidden

set path+=**
set wildmenu

" file encryption
" TODO neovim encryption?
" set cryptmethod=blowfish

syntax on

set list listchars=tab:»·,trail:· " trailing whitespace

" ===== leader =====
nnoremap <Space> <Nop>
let mapleader=" "

" shortcut for dropping into a code block and auto-indenting
inoremap <C-]> <CR><Esc>O

" ===== splits =====
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-=> <C-W>=

set splitbelow
set splitright

" ===== files =====
" easy expansion for active file dir
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ===== definitions =====
" open definition in vertical window
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ===== search settings =====
set incsearch
set hlsearch

" ===== swaps =====
set noswapfile
set nobackup
set nowb

" ===== indents =====
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" ===== folding =====
set foldmethod=indent

filetype plugin indent on

" ===== wraps =====
set nowrap
set linebreak

command! -nargs=* Wrap set wrap linebreak nolist textwidth=0 wrapmargin=0
command! -nargs=* NoWrap set nowrap

" ===== scrolling =====
set scrolloff=8
set sidescrolloff=10
set sidescroll=1

" ===== clipboard =====
set clipboard=unnamed

" jump to last know cursor location
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

function! FormatXML()
    :%!xmllint --format -
endfunction
command! FormatXML :call FormatXML()

function! FormatJSON()
    :%!python -m json.tool
endfunction
command! FormatJSON :call FormatJSON()

" ===== plugins =====
call plug#begin('~/.nvim/bundle')

Plug 'benekastah/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'

Plug 'roberthorn/vim-hybrid'

Plug 'sbdchd/neoformat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

Plug 'gabrielelana/vim-markdown'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

Plug 'mattn/emmet-vim'

Plug 'rust-lang/rust.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()
" ===== end plugins =====

" ===== polyglot =====
let g:polyglot_disabled = ['markdown']

" ===== easymotion =====
map <leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)

" ===== coc.nvim =====
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.nvim/bundle/vim-snippets/snippets'

" ===== theme =====
set termguicolors
set background=dark
colorscheme hybrid

" ===== tagbar =====
nnoremap <silent> <leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" ===== airline =====
set laststatus=2
set noshowmode
let g:airline_theme = 'raven'
let g:airline_powerline_fonts = 1
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = ''
let g:airline_section_y = '%{&filetype}'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" ===== vim-markdown
let g:markdown_enable_spell_checking = 0
let g:markdown_mapping_switch_status = "<Leader>x"

" ===== bufferline =====
let g:bufferline_echo = 0

" ===== fugitive =====
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit -a<cr>

" ===== ctrlp =====
if executable('ag')
    " use silver searcher
    set grepprg=ag\ --nogroup\ --nocolor
    " use ag in CtrlP
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching=0
    let g:ctrlp_custom_ignore = {
        \ 'dir': 'node_modules\|\.git'
        \ }
endif

" ===== fzf =====
nnoremap <C-f> :FZF
nnoremap <Leader>; :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>

" ===== ranger =====
let g:ranger_map_keys = 0
nnoremap <leader>r :Ranger<CR>

" ===== gitgutter =====
hi clear SignColumn

" ===== neomake =====
autocmd! BufWritePost * Neomake

" =====================
" ===== Languages =====
" =====================

" ===== Go =====
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

au FileType go map <C-\> :vsp <CR>:GoDef<CR>

" ===== Markup =====
" Align GitHub Markdown tables
augroup markdown
    au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
    au FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
augroup END

au Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
au Filetype json setlocal ts=2 sts=2 sw=2 expandtab

au Filetype ruby setlocal ts=2 sts=2 sw=2

" ===== Lisp =====
augroup Lisp
    au FileType lisp let b:delimitMate_quotes = "\""
    au FileType lisp setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" ===== JavaScript =====
augroup Javascript
    au Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
    au Filetype javascript setlocal formatprg=prettier\ --single-quote
    au Filetype javascript.jsx setlocal formatprg=prettier\ --single-quote
    let g:neoformat_try_formatprg = 1
augroup END

augroup TypeScript
	au Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab
	au Filetype typescript setlocal formatprg=prettier\ --single-quote
	au Filetype typescript.tsx setlocal formatprg=prettier\ --single-quote
	let g:neoformat_try_formatprg = 1
augroup END

augroup HTML
    au Filetype html setlocal ts=2 sts=2 sw=2 expandtab
	au Filetype css setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup Protobuf
    au Filetype proto setlocal ts=2 sts=2 sw=2 expandtab
augroup END

"au BufWritePre *.js Neoformat
"au BufWritePre *.jsx Neoformat

" ===== Python =====
"autocmd Filetype python setlocal ts=4 sts=4 sw=4
