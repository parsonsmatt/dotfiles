let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

nnoremap <Leader>hs :%!stylish-haskell<CR>

nnoremap <buffer> <Leader>t :HdevtoolsType<CR>
nnoremap <buffer> <Leader>c :HdevtoolsClear<CR>
nnoremap <buffer> <Leader>i :HdevtoolsInfo<CR>
