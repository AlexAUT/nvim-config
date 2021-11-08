call plug#begin('~/.vim/plugged')

" Colors
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'gruvbox-community/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'EdenEast/nightfox.nvim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'

" LSP/IDE
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'derekwyatt/vim-fswitch'
Plug 'rhysd/vim-clang-format'
Plug 'ray-x/lsp_signature.nvim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'puremourning/vimspector'
Plug 'cdelledonne/vim-cmake'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

Plug 'beyondmarc/hlsl.vim'

call plug#end()

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

autocmd FileType c,cpp,cs,java,cuda,glsl setlocal commentstring=//\ %s

"Setup fswitch to search in inc for header
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.h let b:fswitchdst = 'cpp,cu' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.cu let b:fswitchdst = 'cuh,hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.cuh let b:fswitchdst = 'cu,cpp' | let b:fswitchlocs = 'reg:/include/src'

" let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#auto_formatexpr = 1

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20
