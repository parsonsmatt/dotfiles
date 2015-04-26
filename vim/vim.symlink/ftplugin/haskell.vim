let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

" hdevtools

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" ghc-mod

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>
