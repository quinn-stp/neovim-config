return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	}
}
-- local PADDING_X = 20
-- local PADDING_Y = 10
-- 
-- return {
-- 	'nvim-tree/nvim-tree.lua',
-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
-- 	lazy = false,
-- 	opts = {
-- 		-- view = {
-- 		-- 	float = {
-- 		-- 		enable = true,
-- 		-- 		open_win_config = function()
-- 		-- 			return {
-- 		-- 				border = 'rounded',
-- 		-- 				relative = 'editor',
-- 		-- 				row = PADDING_Y,
-- 		-- 				col = PADDING_X,
-- 		-- 				width = vim.opt.columns:get() - PADDING_X * 2,
-- 		-- 				height = vim.opt.lines:get() - PADDING_Y * 2
-- 		-- 			}
-- 		-- 		end
-- 		-- 	},
-- 		-- 	width = function()
-- 		-- 		return vim.opt.columns:get() - PADDING_X * 2
-- 		-- 	end
-- 		-- },
-- 	},
-- 	init = function()
-- 		local api = require('nvim-tree.api')
-- 		vim.keymap.set('n', '<leader>to', api.tree.open, {})
-- 		vim.keymap.set('n', '<leader>tr',
-- 			function()
-- 				api.tree.find_file({ open = true, focus = true })
-- 			end,
-- 			{})
-- 	end
-- }
