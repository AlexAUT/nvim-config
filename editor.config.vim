set clipboard=unnamed,unnamedplus

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set smarttab
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Line numbers
set number relativenumber
set nu rnu

"" Undo settings
set undofile
set undodir=$HOME/.cache/nvim/undo
set undolevels=100
set undoreload=100

" Blinking cursor
set gcr=a:blinkon0

" Detect style
set modeline
set modelines=20

" Center on search result
nnoremap n nzzzv
nnoremap N Nzzzv

" Decrease update time
set updatetime=300

" Folding based on treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=10

