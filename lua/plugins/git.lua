return {
	{
		'sindrets/diffview.nvim',
		init = function ()
			vim.keymap.set('n', '<leader>gd', require('diffview').open)
		end,
		opts = function()
			return {
				keymaps = {
					view = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					file_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					file_history_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					option_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
				}
			}
		end
	}
}
