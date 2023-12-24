return {
	{
		'sindrets/diffview.nvim',
		init = function ()
			vim.keymap.set('n', '<leader>gd', require('diffview').open)
			vim.opt.fillchars:append { diff = "╱" }
		end,
		opts = function()
			return {
				keymaps = {
					view = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					file_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					file_history_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
					option_panel = {
						{ 'n', '<leader>q', require('diffview').close }
					},
				}
			}
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			on_attach = function(bufnr)
				local gs = require('gitsigns.actions')

				local function map(mode, lhs, rhs, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Navigation
				map(
					'n', ']c',
					function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end,
					{expr = true})

				map(
					'n', '[c',
					function()
						if vim.wo.diff then return '[c' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end,
					{expr = true})

				--Actions
				map('n', '<leader>ghs', gs.stage_hunk)
				map('n', '<leader>ghr', gs.reset_hunk)
				map('v', '<leader>ghs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				map('v', '<leader>ghr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				map('n', '<leader>gS', gs.stage_buffer)
				map('n', '<leader>ghu', gs.undo_stage_hunk)
				map('n', '<leader>gR', gs.reset_buffer)
				map('n', '<leader>ghp', gs.preview_hunk)
				map('n', '<leader>gb', function() gs.blame_line{full=true} end)
				map('n', '<leader>gtb', gs.toggle_current_line_blame)
				map('n', '<leader>gtd', gs.toggle_deleted)

				-- Text object
				map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end
		}
	}
}
