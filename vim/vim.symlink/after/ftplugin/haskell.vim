nnoremap <buffer> <Leader>t :GhcModType<CR>
au BufWritePost *.hs :GhcModCheckAndLintAsync
