let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

setlocal omnifunc=necoghc#omnifunc
nnoremap <Leader>hs :%!stylish-haskell<CR>
" eta reduce
nnoremap <Leader>he f=F=b"edex/<C-r>e<CR>dwx
" parentheses -> $
nnoremap <buffer> <Leader>hd F(f(i$ <ESC>%%x``x

nnoremap <buffer> <Leader>t :GhcModType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :GhcModInfo<CR>
au BufWritePost *.hs :GhcModCheckAndLintAsync
