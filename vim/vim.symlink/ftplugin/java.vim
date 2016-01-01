"Take care of indents for Java.
set autoindent
set si
set softtabstop=4
set shiftwidth=4
"Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

let java_comment_strings=1
let java_highlight_java_lang_ids=1

let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150
syn clear javaError
syn match javaError "<<<\|\.\.\|=>\|||=\|&&=\|\*\/"
syn match javaFuncDef "[^-]->"

nnoremap <Leader>g :! gradle build<CR>
nnoremap <Leader>d :! gradle deploy<CR>
setlocal omnifunc=javacomplete#Complete
map <leader>b :call javacomplete#GoToDefinition()<CR>
let g:nailgun_port=2113
let g:javacomplete_ng="ng"

nmap <Leader>jr <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <Leader>ja <Plug>(JavaComplete-Imports-AddMissing)
