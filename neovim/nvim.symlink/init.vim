" Fresh neovim configuration

call plug#begin()

" Plug 'benekastah/neomake'
Plug 'godlygeek/tabular'
Plug 'parsonsmatt/vim-hdevtools'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
" Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'tpope/vim-surround'
Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/vim-haskell-indent'
Plug 'eagletmt/ghcmod-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
Plug 'Shougo/vimproc.vim', {'do': 'make -f  make_unix.mak'}

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

filetype plugin indent on

syntax on

set background=dark
colorscheme gruvbox

let mapleader = ' '

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
command W w
command Q q

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

" Use Haskell for PureScript
au BufNewFile,BufRead *.purs setf haskell

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

set nofoldenable

" markdown languages
let g:markdown_fenced_languages = ['java', 'haskell', 'javascript', 'ruby', 'c', 'cpp']

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" neomake
" autocmd! BufWritePost * Neomake
" 
" let g:neomake_haskell_hlint_maker = {
"     \ 'args': [ '%:p', '-XQuasiQuotes', '-XTemplateHaskell', '-hGeneralise', '-hDefault'],
"     \ 'errorformat': '%W%f:%l:%v: Warning: %m,' .
"             \ '%I%f:%l:%v: Suggestion: %m,' . ''
"     \ }


" Syntastic settings:
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
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
nnoremap <Leader>e :CtrlP<cr>

set ruler

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),{:}"
let delimitMate_expand_space = 1

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
