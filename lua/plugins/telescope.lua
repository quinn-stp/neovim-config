return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
		opts = function()
			return {
				defaults = {
					sorting_strategy = 'ascending',
					layout_strategy = 'horizontal',
					layout_config = { prompt_position = 'top' },
					border = true,
					mappings = {
						i = {
							['<S-CR>'] = require('telescope.actions').smart_send_to_qflist,
						},
						n = {
							['<S-CR>'] = require('telescope.actions').smart_send_to_qflist,
						},
					}
				}
			}
		end,
        keys = function()
			local builtin = require('telescope.builtin')
            return {
                { '<leader>ff', builtin.find_files },
                { '<leader>fg', builtin.live_grep },
                { '<leader>fs', builtin.grep_string }
            }
        end
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
        keys = function()
            return {
                {
                    '<leader>fb',
                    function()
                        require('telescope').extensions.file_browser.file_browser({select_buffer = true})
                    end
                }
            }
        end
	}
}
