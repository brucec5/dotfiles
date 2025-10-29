set nocompatible

"For vim-plug
call plug#begin()

"Plug 'chriskempson/base16-vim'
Plug 'jeffkreeftmeijer/vim-dim'

Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

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
set notermguicolors

" Map C-s to a nop???
nnoremap <silent> <C-S> <NOP>

" Map CtrlP to <leader>t to be like Command-T
nmap <silent> <leader>t :CtrlP<CR>

nmap <silent> <leader>b :CtrlPBuffer<CR>

nmap <silent> <leader>g :CtrlPTag<CR>
" Clear the search highlight with <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>

" Toggle NERDTree with leader-f
"nmap <silent> <leader>f :NERDTreeToggle<CR>

nmap <F1> <Esc>
imap <F1> <Esc>

set background=dark
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry

" Highlight the current line!
set cursorline
hi CursorLine cterm=bold
hi CursorLineNR ctermbg=0 cterm=bold

" Override the .md file extension to be for markdown instead of modula
au BufRead,BufNewFile *.md set filetype=markdown

let g:vim_markdown_folding_disabled=1

" Turn off the damn bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

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
