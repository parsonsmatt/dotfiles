nnoremap <buffer> <Leader>t :GhcModType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :GhcModInfo<CR>
au BufWritePost *.hs :GhcModCheckAndLintAsync
