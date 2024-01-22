return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query' },
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { 'cpp' }
			}
		},
		config = function(plugin, opts)
			require('nvim-treesitter.configs').setup(opts)
		end
	},
	{
		'Wansmer/treesj',
		opts = {
			use_default_keymaps = false
		},
		keys = function()
			return {
				{ '<leader>rs', require('treesj').split },
				{ '<leader>rj', require('treesj').join }
			}
		end
	}
}
