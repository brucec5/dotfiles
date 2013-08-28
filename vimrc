set nocompatible

" For Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'henrik/vim-indexed-search.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree.git'
Bundle 'godlygeek/tabular'
Bundle 'zeis/vim-kolor'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'airblade/vim-gitgutter'

" make plugin loading easier
"call pathogen#infect()

"change mapleader to , from \
let mapleader=","

" Quickly edit/reload the .vimrc
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

syntax on
set hidden
set number
set tabstop=2
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set smartindent
set autoindent
set expandtab
set backupdir=~/.vim/swp/
set directory=~/.vim/swp/

filetype plugin indent on

" Map ; to : for easier commands
nnoremap ; :

" Map C-s to a nop???
nnoremap <silent> <C-S> <NOP>

" Map CtrlP to <leader>t to be like Command-T
nmap <silent> <leader>t :CtrlP<CR>

nmap <silent> <leader>b :CtrlPBuffer<CR>
" Clear the search highlight with <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>

" Toggle NERDTree with leader-f
nmap <silent> <leader>f :NERDTreeToggle<CR>

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
  colorscheme xcolors
else
  set background=dark
  colorscheme kolor
endif

" Highlight the current line!
set cursorline
hi CursorLine cterm=bold gui=bold guibg=bg

set wildignore+=*.class,*.jar,*.apk,*/*doc/*,*/bin/*,*/vendor/*,*/log/*,*/sql/*

" Override the .md file extension to be for markdown instead of modula
au BufRead,BufNewFile *.md set filetype=markdown

let g:vim_markdown_folding_disabled=1

" Turn off the damn bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Mapping for tabularizing on equals
nmap <silent> <leader><Tab>= :Tab /=<CR>
nmap <silent> <leader><Tab>> :Tab /=><CR>

" Map <C-movement key> to move buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Right> <C-w><Right>
map <C-Left> <C-w><Left>

" Turn on indent guides at start?
let g:indent_guides_enable_on_vim_startup=1
