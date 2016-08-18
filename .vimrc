call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'rstacruz/sparkup'
call plug#end()

set nocompatible

syntax enable

colorscheme smyck

filetype plugin indent on
set nocompatible

" Disable arrow keys
noremap <Up> <NOP>
inoremap <Up> <NOP>
noremap <Down> <NOP>
inoremap <Down> <NOP>
noremap <Left> <NOP>
inoremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Right> <NOP>
noremap h <NOP>
noremap l <NOP>


" Exit insert mode with jk
inoremap jk <Esc>

let mapleader=","
noremap <leader>p :Files<enter>
noremap <leader>l :Buffers<enter>
noremap <leader>m :w<enter>
nnoremap <space> /
nnoremap <enter> :
map q <Plug>(easymotion-prefix)

" Don't highligt mathing
let g:loaded_matchparen=1

set relativenumber

set nowrap

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch 

" Leave modified buffers
set hidden

" Turn backup off
set nobackup
set nowb
set noswapfile
