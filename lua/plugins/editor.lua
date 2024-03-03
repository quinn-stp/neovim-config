return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'RRethy/vim-illuminate',
        config = function(_, opts)
            require('illuminate').configure(opts)
        end,
        opts = {
            min_count_to_highlight = 2
        }
    },
    {
        'stevearc/dressing.nvim',
        opts = {
            input = {
                insert_only = false,
                start_in_insert = false,
                border = 'solid',
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["k"] = "HistoryPrev",
                        ["j"] = "HistoryNext",
                    },
                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
                override = function(config)
                    config.title = ''
                    return config
                end
            }
        }
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            scope = {
                show_start = false,
                show_end = false
            }
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        main = 'treesitter-context',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        opts = {}
    }
}
