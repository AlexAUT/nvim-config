" FZF
nnoremap <silent> <leader><space> :GFiles<CR>
nnoremap <silent> <leader>p :Files<CR>
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

