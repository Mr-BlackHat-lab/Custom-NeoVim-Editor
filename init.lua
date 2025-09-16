require("config.lazy")
require("keymaps")
-- Line numbers
vim.opt.number = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Enable syntax highlighting
vim.cmd("syntax enable")
vim.o.timeoutlen = 200 
vim.g.mapleader = " "
