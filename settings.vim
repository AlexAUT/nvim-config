" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set cmdheight=2                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set termguicolors                       " Enable term gui colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set cursorline                          " Enable highlighting of the current line
" set showtabline=2                       " Always show tabs
set clipboard=unnamedplus               " Copy paste between vim and everything else
set number                              " Line numbers
set number relativenumber
set nu rnu
set completeopt=menu,menuone,noselect
set guicursor=a:blinkon100
set modeline
set modelines=20
set updatetime=300
set signcolumn=yes
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=2

set undofile
set undodir=$HOME/.cache/nvim/undo
set undolevels=100
set undoreload=100

" Color
colorscheme duskfox

" Remap typos
cnoreabbrev W! w!
cnoreabbrev Q! Q!
cnoreabbrev Qall! Qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

autocmd BufNewFile,BufRead *.slang set syntax=hlsl
autocmd BufNewFile,BufRead *.slangh set syntax=hlsl
