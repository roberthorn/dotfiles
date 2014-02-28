set nocompatible
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

syntax on

" remappings
let mapleader=","
set pastetoggle=<F2>

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-=> <C-W>=

" buffers
nmap <leader>l :bn<cr>
nmap <leader>k :bp<cr>
nmap <leader>q :bd<cr>

set splitbelow
set splitright

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin indent on

set nowrap
set linebreak

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


" ===== pathogen =====
execute pathogen#infect()
call pathogen#helptags()

" ===== theme =====
colorscheme hybrid

" ===== go =====
filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
" gofmt on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

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
endif

" ===== NERDTree =====
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" ===== gitgutter =====
hi clear SignColumn
