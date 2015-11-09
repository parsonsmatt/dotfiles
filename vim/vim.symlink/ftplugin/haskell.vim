let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

nnoremap <Leader>hs :%!stylish-haskell<CR>

nnoremap <buffer> <Leader>t :GhcModType<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :GhcModInfo<CR>

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

autocmd BufWritePost *.hs :GhcModCheckAndLintAsync
