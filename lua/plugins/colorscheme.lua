return {
    'neanias/everforest-nvim',
    main = 'everforest',
    lazy = false,
    priority = 1000,
    config = {
        background = 'hard',
        float_style = 'dim',
        on_highlights = function(hl, palette)
            -- palette = {
            --   aqua = "#83c092",
            --   bg0 = "#272e33",
            --   bg1 = "#2e383c",
            --   bg2 = "#374145",
            --   bg3 = "#414b50",
            --   bg4 = "#495156",
            --   bg5 = "#4f5b58",
            --   bg_blue = "#384b55",
            --   bg_dim = "#1e2326",
            --   bg_green = "#3c4841",
            --   bg_red = "#493b40",
            --   bg_visual = "#4c3743",
            --   bg_yellow = "#45443c",
            --   blue = "#7fbbb3",
            --   fg = "#d3c6aa",
            --   green = "#a7c080",
            --   grey0 = "#7a8478",
            --   grey1 = "#859289",
            --   grey2 = "#9da9a0",
            --   none = "NONE",
            --   orange = "#e69875",
            --   purple = "#d699b6",
            --   red = "#e67e80",
            --   statusline1 = "#a7c080",
            --   statusline2 = "#d3c6aa",
            --   statusline3 = "#e67e80",
            --   yellow = "#dbbc7f"
            -- }
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
        end
    },
    init = function()
        require('everforest').load();
    end
}
