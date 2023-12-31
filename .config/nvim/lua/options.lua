local opt = vim.opt
local opt_local = vim.opt_local

-- General
opt.swapfile = false
opt.clipboard = 'unnamedplus' -- Copy-paste to the system clipboard
opt.shortmess:append('sI')
opt.mouse = 'a'

-- UI
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.wrap = false
opt.completeopt = menu,menuone,noselect
opt.list = true

-- Tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.expandtab = true

-- Performance
opt.history = 100
opt.lazyredraw = true -- Don't redraw during macros

-- Disable builtin plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- File type dependent opts
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'sh',
        'bash',
        'zsh',
        'vue',
        'ts',
        'js',
        'jsx',
        'tsx',
    },
    callback = function()
        opt.tabstop = 2
        opt.softtabstop = 2
        opt.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'go',
    },
    callback = function()
        opt.expandtab = false
    end,
})