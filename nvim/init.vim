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

set path+=**
set wildmenu

" file encryption
" TODO neovim encryption?
" set cryptmethod=blowfish

syntax on

set list listchars=tab:»·,trail:· " trailing whitespace

" ===== remappings =====
let mapleader=","

" shortcut for dropping into a code block and auto-indenting
inoremap <C-e> <CR><Esc>O

" ===== splits =====
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-=> <C-W>=

set splitbelow
set splitright

" ===== buffers =====
nnoremap <leader>l :bn<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>q :bwipeout<cr>

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

Plug 'tpope/vim-markdown'

Plug 'sbdchd/neoformat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
"Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'mattn/emmet-vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'

Plug 'wlangstroth/vim-racket'

Plug 'rust-lang/rust.vim'

call plug#end()
" ===== end plugins =====

" ===== easymotion =====
map <Space> <Plug>(easymotion-prefix)

let g:deoplete#enable_at_startup = 1

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
nnoremap ; :Buffers<CR>
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
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

au Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
au Filetype json setlocal ts=2 sts=2 sw=2 expandtab

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

augroup HTML
	au Filetype html setlocal ts=2 sts=2 sw=2 expandtab
augroup END

"au BufWritePre *.js Neoformat
"au BufWritePre *.jsx Neoformat

" ===== Python =====
"autocmd Filetype python setlocal ts=4 sts=4 sw=4
