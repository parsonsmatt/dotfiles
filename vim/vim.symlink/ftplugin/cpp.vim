set shiftwidth=4
set expandtab
set softtabstop=4

map <Leader>t :w<CR> :call system('echo "make test" > .test_runner')<CR>
map <Leader>mt :w<CR> :call system('echo "make mtest" > .test_runner')<CR>
