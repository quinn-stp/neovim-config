return {
    'neanias/everforest-nvim',
    main = 'everforest',
    config = {
        background = 'hard',
        float_style = 'dim',
    },
    init = function()
        require('everforest').load();
    end
}

-- return {
-- 	'EdenEast/nightfox.nvim',
-- 	init = function()
-- 		vim.cmd('colorscheme carbonfox')
--
-- 		local palette = require('nightfox.palette').load('carbonfox')
--
-- 		local hl_groups = {
-- 			-- UI
-- 			-- { 'NormalFloat', { bg = palette.black.base }},
-- 			{ 'MatchParen', { bg = palette.sel1 }},
-- 			{ 'CursorLine', { link = 'Visual' }},
--
-- 			-- Illuminate
-- 			{ 'illuminatedWordText', { underline = true }},
-- 			{ 'illuminatedWordWrite', { link = 'illuminatedWordText' }},
-- 			{ 'illuminatedWordRead', { link = 'illuminatedWordText' }},
--
-- 			-- Telescope
-- 			{ 'TelescopeMatching', { fg = palette.orange.bright, underline = true } },
-- 			{ 'TelescopeSelection', { bg = palette.black.base } },
-- 			{ 'TelescopeNormal', { fg = palette.white.base, bg = palette.black.dim } },
-- 			{ 'TelescopePromptNormal', { bg = palette.black.base } },
-- 			{ 'TelescopeResultsBorder', { fg = palette.black.dim, bg = palette.black.dim } },
-- 			{ 'TelescopePreviewBorder', { fg = palette.black.dim, bg = palette.black.dim } },
-- 			{ 'TelescopePromptBorder', { fg = palette.black.base, bg = palette.black.base } },
-- 			{ 'TelescopePromptTitle', { fg = palette.black.base, bg = palette.blue.bright } },
-- 			{ 'TelescopeResultsTitle', { fg = palette.black.base, bg = palette.cyan.bright } },
-- 			{ 'TelescopePreviewTitle', { fg = palette.black.base, bg = palette.cyan.bright } },
--
-- 			-- Diffview
-- 			{ 'DiffviewFilePanelTitle', { fg = palette.magenta.base } },
-- 			{ 'DiffviewFilePanelCounter', { fg = palette.blue.base } },
-- 			
-- 			-- CMP
-- 			-- { 'CmpItemKindField', { fg = "#EED8DA", bg = "#B5585F" }},
-- 			-- { 'CmpItemKindProperty', { fg = "#EED8DA", bg = "#B5585F" }},
-- 			-- { 'CmpItemKindEvent', { fg = "#EED8DA", bg = "#B5585F" }},
-- 			--
-- 			-- { 'CmpItemKindText', { fg = "#C3E88D", bg = "#9FBD73" }},
-- 			-- { 'CmpItemKindEnum', { fg = "#C3E88D", bg = "#9FBD73" }},
-- 			-- { 'CmpItemKindKeyword', { fg = "#C3E88D", bg = "#9FBD73" }},
-- 			--
-- 			-- { 'CmpItemKindConstant', { fg = "#FFE082", bg = "#D4BB6C" }},
-- 			-- { 'CmpItemKindConstructor', { fg = "#FFE082", bg = "#D4BB6C" }},
-- 			-- { 'CmpItemKindReference', { fg = "#FFE082", bg = "#D4BB6C" }},
-- 			--
-- 			-- { 'CmpItemKindFunction', { fg = "#EADFF0", bg = "#A377BF" }},
-- 			-- { 'CmpItemKindStruct', { fg = "#EADFF0", bg = "#A377BF" }},
-- 			-- { 'CmpItemKindClass', { fg = "#EADFF0", bg = "#A377BF" }},
-- 			-- { 'CmpItemKindModule', { fg = "#EADFF0", bg = "#A377BF" }},
-- 			-- { 'CmpItemKindOperator', { fg = "#EADFF0", bg = "#A377BF" }},
-- 			--
-- 			-- { 'CmpItemKindVariable', { fg = "#C5CDD9", bg = "#7E8294" }},
-- 			-- { 'CmpItemKindFile', { fg = "#C5CDD9", bg = "#7E8294" }},
-- 			--
-- 			-- { 'CmpItemKindUnit', { fg = "#F5EBD9", bg = "#D4A959" }},
-- 			-- { 'CmpItemKindSnippet', { fg = "#F5EBD9", bg = "#D4A959" }},
-- 			-- { 'CmpItemKindFolder', { fg = "#F5EBD9", bg = "#D4A959" }},
-- 			--
-- 			-- { 'CmpItemKindMethod', { fg = "#DDE5F5", bg = "#6C8ED4" }},
-- 			-- { 'CmpItemKindValue', { fg = "#DDE5F5", bg = "#6C8ED4" }},
-- 			-- { 'CmpItemKindEnumMember', { fg = "#DDE5F5", bg = "#6C8ED4" }},
-- 			--
-- 			-- { 'CmpItemKindInterface', { fg = "#D8EEEB", bg = "#58B5A8" }},
-- 			-- { 'CmpItemKindColor', { fg = "#D8EEEB", bg = "#58B5A8" }},
-- 			-- { 'CmpItemKindTypeParameter', { fg = "#D8EEEB", bg = "#58B5A8" }},
-- 		}
--
-- 		for _, hl in pairs(hl_groups) do
-- 			vim.api.nvim_set_hl(0, hl[1], hl[2])
-- 		end
-- 	end,
-- 	lazy = false,
-- 	priority = 1000
-- }
