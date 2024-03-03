return {
    'neanias/everforest-nvim',
    main = 'everforest',
    lazy = false,
    priority = 1000,
    config = {
        background = 'hard',
        float_style = 'dim',
        on_highlights = function(hl, palette)
            -- palette = { aqua , bg0 , bg1 , bg2 , bg3 , bg4 , bg5 , bg_blue , bg_dim , bg_green , bg_red , bg_visual , bg_yellow , blue , fg , green , grey0 , grey1 , grey2 , none , orange , purple , red , statusline1 , statusline2 , statusline3 , yellow }
            hl.CurrentWord = { underline = true }

            hl.TelescopeBorder = { bg = palette.bg_dim, fg = palette.bg_dim }
            hl.TelescopeNormal = { bg = palette.bg_dim, fg = palette.fg }
            hl.TelescopePromptTitle = { bg = palette.green, fg = palette.bg_dim }
            hl.TelescopeResultsTitle = { bg = palette.blue, fg = palette.bg_dim }
            hl.TelescopePreviewTitle = { bg = palette.blue, fg = palette.bg_dim }

            hl.DiffviewFilePanelTitle = { fg = palette.purple }
            hl.DiffviewFilePanelCounter = { fg = palette.blue }
            hl.DiffChange = { bg = palette.none }
            hl.DiffText = { bg = palette.bg_blue }

            hl.DiagnosticVirtualTextHint = { fg = palette.green, bg = palette.bg_green }
            hl.DiagnosticVirtualTextInfo = { fg = palette.blue, bg = palette.bg_blue }
            hl.DiagnosticVirtualTextWarn = { fg = palette.yellow, bg = palette.bg_yellow }
            hl.DiagnosticVirtualTextError = { fg = palette.red, bg = palette.bg_red }

            hl.TreesitterContext = { bg = palette.bg, link = palette.none }
            hl.TreesitterContextBottom = { underline = true, sp = palette.grey0 }
        end
    },
    init = function()
        require('everforest').load();
    end
}
