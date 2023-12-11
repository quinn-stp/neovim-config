return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = function()
			local lsp = require('lsp-zero')
			lsp.extend_lspconfig()
			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
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
					lua_ls = function()
						local lua_opts = require('lsp-zero').nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
					require('lsp-zero').default_setup
				}
			}
		end
	},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-nvim-lsp-signature-help'},
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'VonHeikemen/lsp-zero.nvim', 'L3MON4D3/LuaSnip' },
		opts = function()
			local cmp = require('cmp')
			return {
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
				formatting = require('lsp-zero').cmp_format(),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				}
			}
		end
	},
	{'L3MON4D3/LuaSnip'},
	{ 'folke/neodev.nvim', opts = {} }
}
