" FZF
nnoremap <silent> <leader><space> :GFiles<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>A :call SearchWordWithAg()<CR>
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry

nnoremap [q :Cprev<CR>
nnoremap ]q :Cnext<CR>
nnoremap [l :Lprev<CR>
nnoremap ]l :Lnext<CR>

cnoremap <expr> <CR> getcmdtype() == '/' ? '<CR>zz' : '<CR>'
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Vimspector
nnoremap <silent> <leader>dr :VimspectorReset<CR>
nnoremap <silent> <leader>dc :call vimspector#Continue()<CR>
nnoremap <silent> <leader>ds :call vimspector#Stop()<CR>
nnoremap <silent> <leader>dx :call vimspector#ClearBreakpoints()<CR>
nnoremap <silent> <leader>dp :call vimspector#Pause()<CR>
nnoremap <silent> <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>dh :call vimspector#RunToCursor<CR>
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <silent> <F1> :call vimspector#StepOver()<CR>
nnoremap <silent> <F2> :call vimspector#StepInto()<CR>
nnoremap <silent> <F3> :call vimspector#StepOut()<CR>

nnoremap <A-o> :FSHere<CR>

" CMake
function AfterBuildSucceeded()
  :CMakeClose
  call vimspector#Launch()
  " call vimspector#Restart()
endfunction
let g:cmake_jump_on_error = 0
augroup vim-cmake-group
"   autocmd! User CMakeBuildFailed :cfirst
  autocmd! User CMakeBuildSucceeded call AfterBuildSucceeded()
augroup END

nnoremap <silent> <F5> :CMakeBuild --parallel<CR>
