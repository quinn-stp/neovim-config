return {
	'EdenEast/nightfox.nvim',
	init = function()
		vim.cmd('colorscheme carbonfox')

		local palette = require('nightfox.palette').load('carbonfox')

		local hl_groups = {
			-- Telescope
			{ 'TelescopeMatching', { fg = palette.orange.bright, underline = true } },
			{ 'TelescopeSelection', { bg = palette.black.base } },
			{ 'TelescopeNormal', { fg = palette.white.base, bg = palette.black.dim } },
			{ 'TelescopePromptNormal', { bg = palette.black.base } },
			{ 'TelescopeResultsBorder', { fg = palette.black.dim, bg = palette.black.dim } },
			{ 'TelescopePreviewBorder', { fg = palette.black.dim, bg = palette.black.dim } },
			{ 'TelescopePromptBorder', { fg = palette.black.base, bg = palette.black.base } },
			{ 'TelescopePromptTitle', { fg = palette.black.base, bg = palette.blue.bright } },
			{ 'TelescopeResultsTitle', { fg = palette.black.base, bg = palette.cyan.bright } },
			{ 'TelescopePreviewTitle', { fg = palette.black.base, bg = palette.cyan.bright } },
		}

		for _, hl in pairs(hl_groups) do
			vim.api.nvim_set_hl(0, hl[1], hl[2])
		end
	end,
	lazy = false,
	priority = 1000
}
