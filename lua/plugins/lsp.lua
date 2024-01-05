return {
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', 'neovim/nvim-lspconfig' },
		branch = 'v3.x',
		config = function()
			local lsp = require('lsp-zero')
			lsp.extend_lspconfig()
			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })

				local telescope = require('telescope.builtin')
				vim.keymap.set('n', '<leader>fr', telescope.lsp_references, { buffer = bufnr })

				vim.diagnostic.config {
					signs = false,
					underline = true,
					virtual_text = {
						spacing = 1
					},
					virtual_lines = false,
					update_in_insert = true,
					float = {
						header = false,
						border = 'none',
						focusable = true,
					}
				}

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
					vim.lsp.handlers.hover, {
						border = 'none'
					}
				)
			end)
			lsp.set_sign_icons({
				error = '✘',
				warn = '▲',
				hint = '⚑',
				info = '»'
			})
		end
	},
	{ 'williamboman/mason.nvim', opts = {} },
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'VonHeikemen/lsp-zero.nvim' },
		opts = function()
			return {
				ensure_installed = { 'clangd', 'lua_ls' },
				handlers = {
					require('lsp-zero').default_setup,
					clangd = function()
						require('lspconfig')['clangd'].setup({
							cmd = { vim.fn.stdpath('data') .. '/mason/bin/clangd', '--function-arg-placeholders=false' }
						})
					end
				}
			}
		end
	},
	{'neovim/nvim-lspconfig', dependencies = { 'folke/neodev.nvim' }},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-nvim-lsp-signature-help'},
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
					['<tab>'] = cmp.mapping.confirm()
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
	{'L3MON4D3/LuaSnip'},
	{ 'folke/neodev.nvim', opts = {} },
	{ 'j-hui/fidget.nvim', opts = {} }
}
