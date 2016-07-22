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
set t_Co=256

" file encryption
" TODO neovim encryption?
" set cryptmethod=blowfish

syntax on

set list listchars=tab:»·,trail:· " trailing whitespace

" ===== remappings =====
let mapleader=","
set pastetoggle=<F2>
" ===== end remappings =====

" ===== alias =====
nnoremap <leader>w :w<CR>
nnoremap :Q :q!
" ===== end alias =====

imap <C-e> <CR><Esc>O

" ===== splits =====
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-=> <C-W>=
" ===== end splits =====

" ===== buffers =====
nmap <leader>l :bn<cr>
nmap <leader>k :bp<cr>
nmap <leader>q :bd<cr>

set splitbelow
set splitright
" ===== end buffers =====

" ===== search settings =====
set incsearch
set hlsearch
" ===== end search =====

" ===== swaps =====
set noswapfile
set nobackup
set nowb
" ===== end swaps =====

" ===== indents =====
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set expandtab

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4

filetype plugin indent on
" ===== end indents =====

" ===== wraps =====
set nowrap
set linebreak

command! -nargs=* Wrap set wrap linebreak nolist textwidth=0 wrapmargin=0

" TODO these don't work as expected...
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
" ===== end wraps =====

" ===== scrolling =====
set scrolloff=8
set sidescrolloff=10
set sidescroll=1
" ===== end scrolling =====

" ===== clipboard =====
" TODO clipboard tool needed
" set clipboard=unnamed

" jump to last know cursor location
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd! BufWritePost * Neomake

" ===== plugins =====
call plug#begin('~/.nvim/bundle')

Plug 'benekastah/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'tpope/vim-markdown'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
"Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'rust-lang/rust.vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
"Plug 'walm/jshint.vim'

call plug#end()
" ===== end plugins =====

" ===== theme =====
set background=dark
colorscheme hybrid

" ===== neomake =====
let g:neomake_javascript_enabled_makers = ['eslint']

" ===== go =====
filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
" gofmt on save
let g:go_fmt_command = "goimports"

" ===== airline =====
set laststatus=2
set noshowmode
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
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

" ===== bufferline =====
let g:bufferline_echo = 0

" ===== python =====
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" ===== fugitive =====
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit -a<cr>

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

" ===== NERDTree =====
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" ===== gitgutter =====
hi clear SignColumn

" Align GitHub Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

