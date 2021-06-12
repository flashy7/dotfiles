syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set ic
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
" set colorcolumn=80
set clipboard+=unnamedplus
" set ttimeoutlen=50
" highlight ColorColumn ctermbg=0 guibg=lightgrey
set nohlsearch
set noshowmode

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " vim-surround requires this to make . work

call plug#end()

" Vimtex autocompile on save
" map <F3> :VimtexCompile<CR>
" Spell check toggle on F6
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap j gj
nnoremap k gk
inoremap jj <ESC>

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>d "_d
xnoremap <leader>d "_d

let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

nmap <C-n> :NERDTreeToggle<CR>
map <C-_> <plug>NERDCommenterToggle

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Enables cycling through completions using tab
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Coc configs
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-json', 
    \ ]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Faster search
if executable('rg')
    let g:rg_derive_root='true'
endif

filetype plugin on

" Unmap shift+K of vim-go
let g:go_doc_keywordprg_enabled = 0

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

fun! MyCR()
    if strpart(getline('.'), col('.') - 2, 2) == '{}'
        return "\<CR>\<CR>\<Up>\<ESC>\S"
    endif
    return "\<CR>"
endfun
inoremap <CR> <C-R>=MyCR()<CR>

