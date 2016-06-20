set nocompatible

" For Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'henrik/vim-indexed-search.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree.git'
Plugin 'godlygeek/tabular'
Plugin 'chriskempson/base16-vim'
Plugin 'szw/vim-tags'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-rvm'

call vundle#end()
filetype plugin indent on

"change mapleader to , from \
let mapleader=","

" Quickly edit/reload the .vimrc
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

syntax on
set autoindent
set backspace=indent,eol,start
set copyindent
set confirm
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nobackup
set nomodeline
set noswapfile
set nowritebackup
set number
set ruler
set shiftround
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=2
set wildmenu

imap <silent> jk <Esc>
imap <silent> kj <Esc>

" Map C-s to a nop???
nnoremap <silent> <C-S> <NOP>

" Map CtrlP to <leader>t to be like Command-T
nmap <silent> <leader>t :CtrlP<CR>

nmap <silent> <leader>b :CtrlPBuffer<CR>

nmap <silent> <leader>g :CtrlPTag<CR>
" Clear the search highlight with <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>

" Toggle NERDTree with leader-f
nmap <silent> <leader>f :NERDTreeToggle<CR>

nmap <F1> <Esc>
imap <F1> <Esc>

" Display trailing whitespace as an error
match ErrorMsg /\s\+$/

" If a #! is detected, set executable bit on writing.
function! SetExecutableIfScript(line1, current_file)
	if a:line1 =~ '^#!\(/usr\)*/bin/'
		let chmod_command = "silent !chmod +x " . a:current_file
		execute chmod_command
	endif
endfunction
autocmd BufWritePost * call SetExecutableIfScript(getline(1), expand("%:p"))

" leader l to highlight long lines (length set by textwidth)
nnoremap <silent> <leader>l
			\ :if exists('w:long_line_match') <Bar>
			\ 	silent! call matchdelete(w:long_line_match) <Bar>
			\		unlet w:long_line_match <Bar>
			\	elseif &textwidth > 0 <Bar>
			\		let w:long_line_match = matchadd('ErrorMsg', '\%>' . &tw . 'v.\+', -1) <Bar>
			\	else <Bar>
			\		let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
			\	endif<CR>

" Colorscheme, duh. But load different ones on linux and mac.
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Linux"
  colorscheme desert
else
  set background=dark
  colorscheme base16-eighties
endif

" Highlight the current line!
set cursorline
"hi CursorLine cterm=bold gui=bold guibg=bg
hi CursorLineNR guifg=#ffcc66 ctermbg=3

set wildignore+=*/tmp/*,*/vendor/*,*/log/*,*/sql/*

"let g:ctrlp_user_command = {
  "\ 'types': {
    "\ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard']
    "\ },
  "\ 'fallback': 'find %s -type f'
  "\ }

" Override the .md file extension to be for markdown instead of modula
au BufRead,BufNewFile *.md set filetype=markdown

let g:vim_markdown_folding_disabled=1

" Turn off the damn bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Mapping for tabularizing on equals
nmap <silent> <leader><Tab>= :Tab /=<CR>
nmap <silent> <leader><Tab>> :Tab /=><CR>
nmap <silent> <leader><Tab>{ :Tab /{<CR>

" Map <C-movement key> to move buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Right> <C-w><Right>
map <C-Left> <C-w><Left>

" Autosave on focus loss
autocmd BufLeave,FocusLost * silent! wall

let vimpager_use_gvim = 0
let vimpager_scrolloff = 0
let vimpager_passthrough = 1
