nnoremap <buffer> <Leader>t :GhcModType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :GhcModInfo<CR>
nnoremap <buffer> <Leader>hd f(i$ <ESC>%%x``x
au BufWritePost *.hs :GhcModCheckAndLintAsync
