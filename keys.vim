" Center on search result
nnoremap n nzzzv
nnoremap N Nzzzv

" Map common typos
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

map <F9> :NERDTreeFind<CR>

" Search files
map <C-G> :Files<CR>
map <C-0> :HFiles<CR>
map <C-P> :GFiles<CR>

" Search for content
nnoremap <Leader>s :Ag<Space><C-R>=expand('<cword>')<CR><CR>
vnoremap <Leader>s y:Ag<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader><Leader>a :AgsQuit<CR>

" Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

" Clear highlight
nnoremap <silent> <leader><space> :noh<CR>

" Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" LSP
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gref  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> grn   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gqf   <cmd>lua vim.lsp.buf.code_action()<CR>

" Diagnostics
nnoremap <silent> <F10>  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <S-F10><cmd>lua vim.lsp.diagnostic_goto_prev()<CR>
nnoremap <silent> <F11> <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

nnoremap ]q :try<bar>cn<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>cfirst<bar>endtry<cr>
nnoremap [q :try<bar>cp<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>clast<bar>endtry<cr>
nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
nnoremap [l :try<bar>lp<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>llast<bar>endtry<cr>

" C++ Build
nnoremap <silent> <F5> :CMakeBuild --parallel<CR>

" Vimspector
nnoremap <silent> gvr :VimspectorReset<CR>
nnoremap <silent> gvc :call vimspector#Continue()<CR>
nnoremap <silent> gvstop :call vimspector#Stop()<CR>
nnoremap <silent> gvp :call vimspector#Pause()<CR>
nnoremap <silent> gvb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <F1> :call vimspector#StepOver()<CR>
nnoremap <silent> <F2> :call vimspector#StepInto()<CR>
nnoremap <silent> <F3> :call vimspector#StepOut()<CR>
nnoremap <silent> <F6> :VimspectorReset<CR>


function AfterBuildSucceeded()
     :CMakeClose
     call vimspector#Launch()
endfunction
let g:cmake_jump_on_error = 0
augroup vim-cmake-group
  autocmd! User CMakeBuildFailed :cfirst
  autocmd! User CMakeBuildSucceeded exec AfterBuildSucceeded()
augroup END

nnoremap <F4> :FSHere<CR>
