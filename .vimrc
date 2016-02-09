execute pathogen#infect()

set nocompatible
syntax enable

colorscheme smyck
set rtp+=/usr/local/opt/fzf

" Enable filetype plugins
filetype plugin indent on

let mapleader=","
let maplocalleader="\\"
let g:loaded_matchparen=1

noremap <Up> <NOP>
inoremap <Up> <NOP>
noremap <Down> <NOP>
inoremap <Down> <NOP>
noremap <Left> <NOP>
inoremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Right> <NOP>

noremap <leader>p :FZF!<enter>
noremap <leader>s :w<enter>
nnoremap <enter> :

nnoremap <space> /

inoremap jk <Esc>

set nu
set nowrap

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab



" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch 

" Turn backup off
set nobackup
set nowb
set noswapfile
