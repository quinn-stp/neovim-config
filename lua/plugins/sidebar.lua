return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	init = function()
		vim.keymap.set('n', '<leader>tt', function()
			require('neo-tree.command').execute({
				action = 'focus',
				toggle = true,
				reveal = true
			})
		end)
	end
}
