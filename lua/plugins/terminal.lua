return {
	'akinsho/toggleterm.nvim',
	opts = {
		open_mapping = [[<c-\>]],
		shell = '/usr/local/bin/fish --login',
		shade_terminals = false,
		size = function()
			return vim.o.lines * 0.4
		end
	}
}
