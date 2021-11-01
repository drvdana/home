set nocompatible " Don't try to be vi compatible (required to load plugins too)
filetype off " Helps force plugins to load correctly when it is turned back on below

" SETUP: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'avakhov/vim-yaml' " Dumb-smart indentation for Yaml
Plugin 'altercation/vim-colors-solarized' " Solarized Colorscheme for Vim
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'tpope/vim-rhubarb' " Launch GitHub from Fugitive's GBrowse
Plugin 'ntpeters/vim-better-whitespace' " Highlight and strip whitespace
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale' " Linting engine
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-surround' " cs, ds, yss
Plugin 'vim-airline/vim-airline' " Advanced statusline
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on " For plugins to load correctly, also turns on filetype detection

""""""""""""""
" Key bindings

" map leader
nnoremap <Space> <nop>
let mapleader = " "

" quick search/replace
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/

" clear search
map <silent> <leader><Space> :let @/=''<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Toggle visual tabs and newlines
map <silent> <leader>l :set list!<CR>

" buffer control
nnoremap <leader><tab> <c-^>
nnoremap <leader>w :bdelete<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>h :bprev<CR>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap ; :Files<CR>
nnoremap <leader>g :Ag<CR>

" Github commands
nnoremap gc :Git commit -a<CR>
nnoremap gp :Git push<CR>
nnoremap gb :Git blame<CR>
nnoremap gs :Git<CR>
nnoremap go :GBrowse<CR>
nnoremap gd :Gdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdb :diffget //3<CR>

""""""""""
" Settings
set directory=$HOME/.vim/swap// " keep .swp files in a different directory
set mouse=nv " allow mouse scrolling
set clipboard=unnamed " yank to clipboard
set hidden " Allow hidden buffers (e.g. behind other tabs)
syntax on " Turn on syntax highlighting
set modelines=0 " Security - don't execute arbitrary modelines
set number relativenumber  " Show line numbers
highlight LineNr ctermfg=darkgrey
set ruler " Show file stats
set visualbell " Blink cursor on error instead of beeping (grr)
set encoding=utf-8 " Encoding
set wrap " Wrap lines at window edge, does not break lines
set textwidth=120 " Break lines
set tabstop=2 " width of a hard tab
set expandtab " insert spaces with <tab>
set shiftwidth=2 " indent size, =, < and > use this
set softtabstop=2 " simulates tabstops if different than tabstop
set autoindent " when starting a newline, indent
set shiftround " align indents to tab columns
set scrolloff=4 " offset lines from window edge while scrolling
set backspace=indent,eol,start
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set showmode
set showcmd
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
" format options:
" c = autowrap comments at textwidth
" q = allow formatting with 'gq'
" r = auto insert comment leader after <Enter>
" n = recognize numbered lists when formatting
" 1 = don't break a line after a single letter word
set formatoptions=cqrn1

" use % to jump between pairs
set matchpairs+=<:>
runtime! macros/matchit.vim

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}

let g:ale_fix_on_save = 1

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

let g:solarized_termcolors = 256
set t_Co=256
colorscheme solarized
highlight Normal ctermbg=None

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
