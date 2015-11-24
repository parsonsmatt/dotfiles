"Take care of indents for Java.
set autoindent
set si
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
