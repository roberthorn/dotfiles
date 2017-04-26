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

set path+=**
set wildmenu

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
nmap <leader>q :bwipeout<cr>

set splitbelow
set splitright
" ===== end buffers =====

" ===== definitions =====
" open definition in vertical window
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" ===== end definitions =====

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

" ===== folding =====
set foldmethod=indent

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab

filetype plugin indent on
" ===== end indents =====

" ===== wraps =====
set nowrap
set linebreak

command! -nargs=* Wrap set wrap linebreak nolist textwidth=0 wrapmargin=0
" ===== end wraps =====

" ===== scrolling =====
set scrolloff=8
set sidescrolloff=10
set sidescroll=1
" ===== end scrolling =====

" ===== clipboard =====
" TODO clipboard tool needed
set clipboard=unnamed

" jump to last know cursor location
autocmd BufReadPost *
	\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" ===== plugins =====
call plug#begin('~/.nvim/bundle')

Plug 'benekastah/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'

Plug 'roberthorn/vim-hybrid'

Plug 'tpope/vim-markdown'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'

Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'mattn/emmet-vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'

Plug 'wlangstroth/vim-racket'

call plug#end()
" ===== end plugins =====

" ===== easymotion =====
map <Space> <Plug>(easymotion-prefix)

let g:deoplete#enable_at_startup = 1

" ===== theme =====
set termguicolors
set background=dark
colorscheme hybrid

" ===== neomake =====
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
" ===== end neomake =====

" ===== go =====
let g:go_fmt_command = "goimports"
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

" ===== fzf =====
nmap <C-f> :FZF

" ===== ranger =====
"nmap <leader>r :Ranger<CR>

" ===== gitgutter =====
hi clear SignColumn

" Align GitHub Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Lisp
augroup Lisp
	au FileType lisp let b:delimitMate_quotes = "\""
	au FileType lisp setlocal ts=2 sts=2 sw=2 expandtab
augroup END
