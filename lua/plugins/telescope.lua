return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
		opts = function()
			return {
				defaults = {
					sorting_strategy = 'ascending',
					layout_strategy = 'horizontal',
					layout_config = { prompt_position = 'top' },
					border = true,
					mappings = {
						i = {
							['<C-l>'] = require('telescope.actions').send_selected_to_qflist,
						},
						n = {
							['<C-l>'] = require('telescope.actions').send_selected_to_qflist,
						},
					}
				}
			}
		end,
		init = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		end
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' }
	}
}
