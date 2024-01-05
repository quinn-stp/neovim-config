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
	}
}
