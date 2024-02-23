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
                border = 'none'
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
        opts = {}
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
