return {
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', 'neovim/nvim-lspconfig' },
		branch = 'v3.x',
		config = function()
			local lsp = require('lsp-zero')
			lsp.extend_lspconfig()
			lsp.on_attach(function(client, bufnr)
				local telescope = require('telescope.builtin')

				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set('n', 'gd', telescope.lsp_definitions, { buffer = bufnr })
				vim.keymap.set('n', 'gi', telescope.lsp_implementations, { buffer = bufnr })
				vim.keymap.set('n', 'go', telescope.lsp_type_definitions, { buffer = bufnr })
				vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = bufnr })
                if (client.name == 'clangd') then
                    vim.keymap.set('n', 'gh', function() vim.cmd('ClangdSwitchSourceHeader') end, { buffer = bufnr })
                end

				vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { buffer = bufnr })
				vim.keymap.set('x', '<leader>rf', function() vim.lsp.buf.format({async = true}) end, { buffer = bufnr })
				vim.keymap.set('n', '<leader>rF', function() vim.lsp.buf.format({async = true}) end, { buffer = bufnr })
				vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, { buffer = bufnr })

				vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = bufnr })
				vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
				vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })

                local signs = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 '
                }

				vim.diagnostic.config({
					signs = false,
					underline = true,
					update_in_insert = true,
                    severity_sort = true,
					virtual_text = {
						spacing = 1,
                        prefix = '',
                        suffix = ' ',
                        format = function(diagnostic)
                            return signs[diagnostic.severity] .. ' ' .. diagnostic.message
                        end
					},
					float = {
						header = false,
						border = 'solid',
						focusable = true,
					}
				})

				vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'solid' })
				vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'solid' })
			end)
		end
	},
	{ 'williamboman/mason.nvim', opts = {} },
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'VonHeikemen/lsp-zero.nvim' },
		opts = function()
			return {
				ensure_installed = { 'clangd', 'lua_ls', 'jsonls', 'tsserver', 'svelte', 'rust_analyzer', 'cssls', 'jsonls' },
				handlers = {
					require('lsp-zero').default_setup,
					clangd = function()
						require('lspconfig')['clangd'].setup({
							cmd = {
                                vim.fn.expand('$MASON/bin/clangd'),
                                '--function-arg-placeholders=false',
                                '--offset-encoding=utf-16',
                            }
						})
					end
				}
			}
		end
	},
	{'neovim/nvim-lspconfig', dependencies = { 'folke/neodev.nvim' }},
    {
        'https://gitlab.com/schrieveslaach/sonarlint.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim' },
        opts = function()
            return {
                server = {
                    cmd = {
                        'sonarlint-language-server',
                        '-stdio',
                        '-analyzers',
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarcfamily.jar'),
                    },
                    settings = {
                        sonarlint = {
                            pathToCompileCommands = './build/compile_commands.json'
                        }
                    }
                },
                filetypes = {
                    'cpp'
                }
            }
        end
    },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'VonHeikemen/lsp-zero.nvim', 'L3MON4D3/LuaSnip' },
		opts = function()
			local cmp = require('cmp')
			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			return {
				completion = { completeopt = 'menu,menuone,noinsert' },
				mapping = {
					['<tab>'] = cmp.mapping.confirm(),
                    ['<cr>'] = cmp.mapping.confirm()
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
				},
				window = {
					completion = {
						col_offset = -3,
						side_padding = 0
					}
				},
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = function(entry, vim_item)
						vim_item.kind = " " .. kind_icons[vim_item.kind] .. " "
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
					end
				},
			}
		end
	},
	{ 'L3MON4D3/LuaSnip' },
	{ 'folke/neodev.nvim', opts = {} },
	{ 'j-hui/fidget.nvim', opts = {} }
}
