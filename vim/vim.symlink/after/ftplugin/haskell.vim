let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

nnoremap <buffer> <Leader>t :GhcModType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :GhcModInfo<CR>
au BufWritePost *.hs :GhcModCheckAndLintAsync
setlocal omnifunc=necoghc#omnifunc
