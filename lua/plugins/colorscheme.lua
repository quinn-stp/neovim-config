return {
	'navarasu/onedark.nvim',
	opts = {
		style = 'darker'
	},
	init = function()
		require('onedark').load()
	end,
	lazy = false,
	priority = 1000
}
