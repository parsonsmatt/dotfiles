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

nnoremap <buffer> <Leader>t :HdevtoolsType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :HdevtoolsClear<CR>
nnoremap <buffer> <Leader>i :HdevtoolsInfo<CR>
nnoremap <buffer> <Leader>hl :GhcModLintAsync<CR>
nnoremap <buffer> <Leader>hs :GhcModSplitFunCase<CR>
nnoremap <buffer> <Leader>hg :GhcModSigCodegen<CR>
au BufWritePost *.hs :GhcModCheckAndLintAsync
