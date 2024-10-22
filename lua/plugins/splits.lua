return {
    'mrjones2014/smart-splits.nvim',
    opts = {
        cursor_follows_swapped_bufs = true,
        resize_mode = { silent = true }
    },
    init = function()
        vim.opt.splitbelow = true
        vim.opt.splitright = true
    end,
    keys = function()
        return {
            { '<A-h>',       require('smart-splits').move_cursor_left },
            { '<A-j>',       require('smart-splits').move_cursor_down },
            { '<A-k>',       require('smart-splits').move_cursor_up },
            { '<A-l>',       require('smart-splits').move_cursor_right },
            { '<leader>sv',  '<cmd>vsplit<cr>' },
            { '<leader>sh',  '<cmd>split<cr>' },
            { '<leader>sr',  require('smart-splits').start_resize_mode },
            { '<leader>ssh', require('smart-splits').swap_buf_left },
            { '<leader>ssj', require('smart-splits').swap_buf_down },
            { '<leader>ssk', require('smart-splits').swap_buf_up },
            { '<leader>ssl', require('smart-splits').swap_buf_right },
        }
    end
    }
