set nocompatible

set guifont=Fira\ Code:h13

filetype on
filetype plugin on
filetype indent on

syntax on

set number
set relativenumber

set tabstop=2
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set noswapfile

set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img,*.xlsx

call plug#begin('~/.vim/plugged')
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'evanleck/vim-svelte'
  Plug 'leafOfTree/vim-svelte-plugin'
call plug#end()

set background=dark
colorscheme PaperColor

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

