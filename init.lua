vim.g.mapleader = ' '
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require('lazy-bootstrap')
require('lazy').setup('plugins')

