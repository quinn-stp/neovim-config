return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'jsonc', 'cmake', 'svelte', 'typescript', 'css', 'rust' },
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { 'cpp', 'cmake', 'rust' }
			}
		},
		config = function(_, opts)
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
