local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        {
            'Mofiqul/vscode.nvim',
            priority = 1000,
            config = function()
                local vscode = require('vscode')
                vscode.setup()
                vscode.load()
            end,
        },

        {
            'neovim/nvim-lspconfig',
            dependencies = { 'hrsh7th/cmp-nvim-lsp' },
            config = function()
                local lspconfig = require('lspconfig')
                local servers = {
                    'pyright',
                    'gopls',
                    'clangd',
                    'tsserver',
                    'efm',
                    'eslint',
                    'volar',
                }

                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                for _, server in ipairs(servers) do
                    local opts = { capabilities = capabilities }

                    if server == 'efm' then
                        local shellcheck = {
                            lintCommand = 'shellcheck -f gcc -x -',
                            lintStdin = true,
                            lintFormats = { '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m' },
                        }

                        opts.init_options = {
                            documentFormatting = true,
                            hover = false,
                            documentSymbol = false,
                            codeAction = false,
                            completion = false,
                        }
                        opts.settings = {
                            rootMarkers = {
                                'package.json', 'pyproject.toml', 'Cargo.toml', '.git/',
                            },
                            languages = { sh = { shellcheck } },
                        }
                    elseif server == 'eslint' then
                        opts.on_attach = function(_, bufnr)
                            vim.api.nvim_create_autocmd('BufWritePre', {
                                buffer = bufnr,
                                command = 'EslintFixAll',
                            })
                        end
                    elseif server == 'volar' then
                        opts.filetypes = {
                            'typescript', 'javascript', 'javascriptreact',
                            'typescriptreact', 'vue', 'json',
                        }
                    end

                    lspconfig[server].setup(opts)
                end
            end,
        },

        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },

        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
            },
            config = function()
                local cmp = require('cmp')
                local cmp_autopairs = require('nvim-autopairs.completion.cmp')

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                    mapping = {
                        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    },
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'buffer' },
                    }),
                })

                cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
            end,
        },

        {
            'numToStr/Comment.nvim',
            opts = {
                toggler = {
                    line = '<C-_>',
                    block = nil,
                },
                opleader = {
                    line = '<C-_>',
                    block = nil,
                },
                mappings = {
                    extra = false,
                },
            },
        },

        {
            'lewis6991/gitsigns.nvim',
            config = true,
        },

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require('nvim-treesitter.configs').setup({
                    ensure_installed = {
                        'bash', 'c', 'cpp', 'html', 'css', 'javascript',
                        'typescript', 'json', 'json5', 'yaml', 'vue', 'tsx',
                        'lua', 'python', 'go', 'rust', 'vim', 'csv', 'xml',
                        'git_config', 'git_rebase', 'gitcommit', 'gitignore',
                        'gitattributes', 'gomod', 'gosum', 'haskell', 'jq',
                        'latex', 'make', 'markdown', 'markdown_inline', 'ninja',
                        'sql', 'ssh_config', 'terraform',
                    },
                    sync_install = false,
                    highlight = { enable = true },
                })
            end,
        },

        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-tree/nvim-web-devicons' },
        {
            'nvim-telescope/telescope.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim',
                'nvim-tree/nvim-web-devicons',
            },
        },

        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            opts = {
                options = {
                    theme = 'vscode',
                    section_separators = {},
                },
            },
        },

        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            config = true,
        },

        {
            'petertriho/nvim-scrollbar',
            opts = {
                handle = { color = '#343434' },
            },
        },
    },
})
