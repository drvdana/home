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
Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'
Plugin 'ap/vim-buftabline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" For plugins to load correctly, also turns on filetype detection
filetype plugin indent on

" Allow hidden buffers
set hidden

" buffer control
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-W> :bdelete<CR>

nnoremap ; :Files<CR>

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

" Wrap lines at window edge, does not break lines
set wrap

" Break lines
set textwidth=80

" format options:
" c = autowrap comments at textwidth
" q = allow formatting with 'gq'
" r = auto insert comment leader after <Enter>
" n = recognize numbered lists when formatting
" 1 = don't break a line after a single letter word
set formatoptions=cqrn1

" width of a hard tab
set tabstop=2

" insert spaces with <tab>
set expandtab

" indent size, =, < and > use this
set shiftwidth=2

" simulates tabstops if different than tabstop
set softtabstop=2

" align indents to tab columns
set shiftround

" offset lines from window edge while scrolling
set scrolloff=4
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
" clear search
map <leader><space> :let @/=''<cr>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Use your leader key + l to toggle on/off
map <leader>l :set list!<CR>

nnoremap gc :Gcommit -a<CR>
nnoremap gp :Gpush<CR>
nnoremap gb :Gblame<CR>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1

" Hack setting .yaml files to cloudforamtion
" (Consider renaming my yaml files)
" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.yaml set filetype=cloudformation

" Color scheme (terminal)
set background=dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
