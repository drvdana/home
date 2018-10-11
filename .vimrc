" keep .swp files in a different directory
set directory=$HOME/.vim/swap//

" allow mouse scrolling
set mouse=nv

" yank to clipboard
set clipboard=unnamed

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'avakhov/vim-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'
Plugin 'ap/vim-buftabline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'speshak/vim-cfn'
Plugin 'ntpeters/vim-better-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" For plugins to load correctly
filetype plugin indent on

nnoremap <C-o> :NERDTreeToggle<CR>

" Allow hidden buffers
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-w> :bdelete<CR>

" Turn on syntax highlighting
syntax on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=80
set formatoptions=cqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Rendering
set ttyfast

" Status bar
set laststatus=2

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
let mapleader = ","
map <leader><space> :let @/=''<cr> " clear search

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
