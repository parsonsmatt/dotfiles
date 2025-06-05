let mapleader = ' '
let maplocalleader = ','

call plug#begin()

Plug 'LnL7/vim-nix'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-endwise'
" Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim', {'do': 'make -f  make_unix.mak'}
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
" Plug 'neomake/neomake'
" Plug 'luochen1990/rainbow'
Plug 'linrongbin16/gitlinker.nvim'
Plug 'nvim-lua/plenary.nvim'

" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'alx741/yesod.vim'
Plug 'parsonsmatt/vim2hs'

" PureScript
Plug 'purescript-contrib/purescript-vim'

" Colorschemes
Plug 'iCyMind/NeoSolarized'

call plug#end()

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor Configuration:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

" Why would terminals want line numbers???
au TermOpen * setlocal nonumber norelativenumber

filetype plugin indent on
syntax on

set background=light
set termguicolors
colorscheme NeoSolarized
highlight Conceal ctermbg=NONE guibg=NONE

" Clear highlighting
nnoremap <silent> <leader><leader> :noh<CR><C-l>

" Noop the arrow keys in normal mode
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

" fat shift fingers
command! W w
command! Q q

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

" Line numbers
set number
set relativenumber
set numberwidth=2
" highlight LineNr term=bold cterm=none ctermfg=DarkGrey ctermbg=NONE
" highlight CursorLineNr term=bold cterm=none ctermfg=DarkGreen ctermbg=NONE

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

" Disable folding
set nofoldenable

set ruler

" Load .vim.custom scripts if present.
if filereadable(".vim.custom")
    so .vim.custom
endif

set mouse=a

" Alt-{hjkl} for navigating panes
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Show incremental regex replacement
" TODO: disabled because it is slow
" set inccommand=nosplit

" Edit and reload vim configuration
nnoremap <Leader>fed :e ~/.nvim/init.vim<CR>
nnoremap <Leader>fer :so ~/.nvim/init.vim<CR>

nnoremap <A-t> :terminal<CR>

" Pane/split management
nnoremap <Leader>v :vsplit<cr>
nnoremap <Leader>s :split<cr>
nnoremap <Leader>e :FZF<cr>

" when writing to a file in a non-existing directory, create the directory and
" all parents
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Neomake
" autocmd BufWritePost * silent Neomake
" let g:neomake_open_list = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Configuration:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Haskell
nnoremap <leader>hs ms:%!stylish-haskell<cr>'s

au BufRead,BufNewFile *.persistentmodels set filetype=yesod

nnoremap <leader>f :cf<cr>
nnoremap <leader>n :cn<cr>

" do tags
nnoremap <silent> <leader>hmt :! codex update<CR> 
" :set tags=<C-R>=system("git rev-parse --show-toplevel")<CR><BS>/codex.tags<CR>

" Delete trailing whitespace
autocmd BufWritePre *.hs :%s/\s\+$//e"

" Let's save undo info!
if !isdirectory($HOME."/.vim-undo")
    call mkdir($HOME."/.vim-undo", "", 0770)
endif
set undodir=~/.vim-undo
set undofile

" Search the word under the cursor
nnoremap <leader>rg viw"ry:Rg <C-r>r<CR>

" PureScript
let g:purescript_indent_case = 2
let g:purescript_indent_let = 2
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2
let g:purescript_indent_dot = 1

""" TODO list macros and commands
" Creates a `new` TODO item templated with the created time.
nnoremap <leader>tdn Go<Esc>I- <CR>    - Created: <Esc>"=strftime('%F')<CR>pkA

function! s:CompleteTodoItem()
    " first, find the lines consisting of the TODO item in question
    " copy the lines into a register
    " then, find/create the file corresponding to today's date
    " insert the TODO item in the file
endfunction

" `C`omplete a given TODO item by moving it into the corresponding daily notes file.
nnoremap <leader>tdc :call s:CompleteTodoItem()

" Set the error format so as to properly handle GHCID errors in the quickfix
" window
let &errorformat='%f:%l:%c:%m,%f:%l:%c-%n:%m,%f:(%l\,%c)-%m'

lua << EOF
require"gitlinker".setup()
EOF
