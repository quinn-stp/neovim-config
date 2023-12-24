return {
	'navarasu/onedark.nvim',
	opts = { },
	init = function()
		require('onedark').load()
	end,
	lazy = false,
	priority = 1000
}
