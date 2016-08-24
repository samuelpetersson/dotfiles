call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'rstacruz/sparkup'
Plug 'keith/swift.vim'
call plug#end()

colorscheme smyck

set nocompatible
syntax enable
filetype plugin indent on

let mapleader=","
nnoremap <space> /
nnoremap <enter> :
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
inoremap jk <Esc>

map q <Plug>(easymotion-prefix)
noremap <leader>p :Files<enter>
noremap <leader>l :Buffers<enter>
noremap <leader>m :w<enter>

" Don't highlight mathing
let g:loaded_matchparen=1
" Show relative numbers
set relativenumber
" Disable word wrap
set nowrap
" Show existing tab with 2 spaces width
set tabstop=2
" When indenting with '>', use 4 spaces width
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
