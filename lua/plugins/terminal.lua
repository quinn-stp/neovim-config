return {
	'akinsho/toggleterm.nvim',
	opts = {
		open_mapping = [[<c-\>]],
		size = function()
			return vim.o.lines * 0.4
		end
	}
}
