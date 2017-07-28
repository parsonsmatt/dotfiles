let mapleader = ' '
let maplocalleader = ','

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-endwise'
Plug 'shawncplus/phpcomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'neomake/neomake'
Plug 'mxw/vim-jsx'
Plug 'kana/vim-arpeggio'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'haya14busa/incsearch.vim'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'elmcast/elm-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Raimondi/delimitMate'

call plug#end()

set runtimepath+=/Users/Ben/.dotfiles/neovim/nvim.symlink/plugged/deoplete.nvim/

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:elm_format_autosave = 1

" Javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

let g:neomake_javascript_enabled_makers = ['eslint']

let g:vim_airline_theme='tomorrow'

filetype plugin indent on
syntax on

set background=dark
set clipboard+=unnamedplus

" Set 80-char line color to dark gray
highlight ColorColumn ctermbg=DarkGray

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

" update faster
set updatetime=250

" Filename even with one window:
set laststatus=2

" Load ctags from codex.tags when available
set tags=tags;/,codex.tags;/

" Enough of this!
command! W w
command! Q q

" Background vim with spc-b
nnoremap <Leader>b <C-z>

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

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

nnoremap <Leader>v :vsplit<cr>
nnoremap <Leader>s :split<cr>
nnoremap <Leader>e :FZF<cr>

" Open terminal
" horizontal
nnoremap <Leader>st :split<CR><C-w><C-w>:term<CR>
nnoremap <Leader>vt :vsplit<CR><C-w><C-w>:term<CR>

" Haskell setup
nnoremap <Leader>hs :vsplit<CR><C-w><C-w>:term<CR>stack ghci<CR><C-\><C-n>:split<CR><C-w><C-w>:term<CR>ghcid<CR><C-\><C-n><C-w><C-w>

" Stylish haskell
:nnoremap <leader>ss v_ip:!stylish-haskell <CR>

" Hindent
:nnoremap <leader>shi v_ip:!hindent <CR>

" Reload file with rr
nnoremap rr :w<CR>:so %<CR>

" Window cycle
map <Leader>w <C-w><C-w>

" NERDTree
nnoremap <Leader>ft :NERDTreeToggle<CR>

set ruler

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),{:}"
let delimitMate_expand_space = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 4
let g:haskell_tabular = 1

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

nnoremap <A-t> :terminal<CR>

" Map jk to esc (chord)
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" autocmd! BufWritePost * Neomake
let g:neomake_haskell_enabled_makers = ['hlint']
let g:neomake_open_list = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

