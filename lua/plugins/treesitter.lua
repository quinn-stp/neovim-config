return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query' },
		highlight = { enable = true },
		indent = { enable = true }
	},
	config = function(plugin, opts)
		require('nvim-treesitter.configs').setup(opts)
	end
}
