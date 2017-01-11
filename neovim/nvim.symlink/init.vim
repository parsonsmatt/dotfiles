" Fresh neovim configuration

let mapleader = ' '
let maplocalleader = ','

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin()

" Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'haya14busa/incsearch.vim'
Plug 'parsonsmatt/vim2hs'
Plug 'tpope/vim-endwise'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc.vim', {'do': 'make -f  make_unix.mak'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
Plug 'tpope/vim-fugitive'
Plug 'nbouscal/vim-stylish-haskell'

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

filetype plugin indent on
syntax on

set background=dark
colorscheme gruvbox

nnoremap <silent> <leader><leader> :noh<CR><C-l>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>


" Better search
set incsearch
set hlsearch
set smartcase
set ignorecase

" Filename even with one window:
set laststatus=2

" Enough of this!
command! W w
command! Q q

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

" Line numbers
set number
set relativenumber
set numberwidth=2
highlight LineNr term=bold cterm=none ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr term=bold cterm=none ctermfg=DarkGreen ctermbg=NONE

" Default indentation:
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab

" highlight the current line in current window; may slow down redrawing
" for long lines or large files
set cursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

" highlight the current column in current window; may slow down redrawing
" for long lines or large files
set cursorcolumn

set scrolloff=5
" haskell conceal
let g:haskell_conceal_wide = 1
let g:haskell_conceal_bad = 1

set nofoldenable

" markdown languages
let g:markdown_fenced_languages = ['java', 'haskell', 'javascript', 'ruby', 'c', 'cpp', 'php']

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Syntastic settings:
let g:syntastic_haskell_checkers=['hdevtools', 'hlint']
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall -g-fwarn-typed-holes -g-XPartialTypeSignatures'
let g:syntastic_haskell_hlint_args = '-XQuasiQuotes -XTemplateHaskell -hGeneralise -hDefault "$@"'
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1
" hdevtools
let g:hdevtools_options = '-g-isrc -g-Wall -g-fwarn-typed-hole -g-fdefer-type-errors -g-XPartialTypeSignatures'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_python_python_exec = '/usr/bin/python3'

" cpp config
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -pedantic -Wformat=2"
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_check_header = 1

nnoremap <Leader>v :vsplit<cr>
nnoremap <Leader>s :split<cr>
nnoremap <Leader>e :FZF<cr>

set ruler

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),{:}"
let delimitMate_expand_space = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>


" Haskell:
nnoremap <leader>hs :%!stylish-haskell<cr>
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 4

let g:haskell_tabular = 1


" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'


if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

nnoremap <silent> <leader>rf :TREPLSendFile<cr>
nnoremap <silent> <leader>rs :TREPLSend<cr>
vnoremap <silent> <leader>rs :TREPLSend<cr>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

imap <buffer> \forall ∀ 
imap <buffer> \to → 
imap <buffer> \lambda λ 
imap <buffer> \Sigma Σ 
imap <buffer> \exists ∃ 
imap <buffer> \equiv ≡

" Use deoplete.
let g:deoplete#enable_at_startup = 1

nnoremap <A-t> :terminal<CR>

" autocmd! BufWritePost * Neomake
" let g:neomake_open_list = 1
