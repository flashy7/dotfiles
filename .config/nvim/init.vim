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
" set relativenumber
set clipboard+=unnamedplus
set nohlsearch
set noshowmode
set completeopt=menuone,noinsert,noselect
set termguicolors
set shortmess+=c

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " vim-surround requires this to make . work

" Neovim v0.5 plugins
Plug 'nvim-lua/plenary.nvim' " Needed for gitsigns and telescope
Plug 'lewis6991/gitsigns.nvim' " Like git gutter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/popup.nvim' " Needed for telescope
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'norcalli/nvim-colorizer.lua' " Colorizes RGB color codes
Plug 'Mofiqul/vscode.nvim'
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

let g:vscode_style = "dark"
colorscheme vscode

" Spell check toggle on F6
map <F6> :setlocal spell! spelllang=en_us<CR>

nnoremap j gj
nnoremap k gk
inoremap jj <ESC>

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>d "_d
xnoremap <leader>d "_d

map <C-_> <plug>NERDCommenterToggle
nnoremap <C-n> :NvimTreeToggle<CR>

filetype plugin on

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

lua <<EOF
require('nvim-treesitter.configs').setup { highlight = { enable = true }}
require('gitsigns').setup()
require('telescope').setup()
require('colorizer').setup()

require('lspkind').init({
    with_text = true,
    preset = 'codicons',
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = 'ƒ',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      Field = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

-- LSP Config setup
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    -- LSP Config setup
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    require 'completion'.on_attach()
end

local servers = { "pyright", "gopls", "bashls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 500,
        }
    }
end
EOF

" LSP Complete Configs
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
let g:completion_trigger_on_delete = 1

" Makes autoindent of auto-pairs plugin work
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
\ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Find files using Telescope command-line sugar.
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>

" Nvim tree stuff
let g:nvim_tree_special_files = {}
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.vscode' ]
