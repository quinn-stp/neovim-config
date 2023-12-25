return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			disabled_filetypes = {
				statusline = {
					'neo-tree',
					'DiffviewFiles'
				}
			}
		}
	},
	init = function()
		vim.opt.showmode = false
		-- vim.opt.laststatus = 3
	end
}
