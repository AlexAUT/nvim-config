"" Plugins
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'

" Searching
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-fswitch'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'Yggdroot/indentLine'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:polyglot_disabled = ['c++11']
Plug 'sheerun/vim-polyglot'

call plug#end()
syntax enable

"Setup fswitch to search in inc for header
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.h let b:fswitchdst = 'cpp,cu' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.cu let b:fswitchdst = 'cuh,hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.cuh let b:fswitchdst = 'cu,cpp' | let b:fswitchlocs = 'reg:/include/src'

"" Search including hidden files
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)



" Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1

" Use // as comment since it works better with uncommenting only parts
autocmd FileType c,cpp,cs,java,cuda,glsl setlocal commentstring=//\ %s


" Completion
let g:completion_matching_smart_case = 1
let g:completion_enable_snippet = 'UltiSnips'
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_trigger_on_delete = 1

autocmd BufEnter * lua require'completion'.on_attach()

" Snippets
let g:UltiSnipsExpandTrigger="<nop>"
