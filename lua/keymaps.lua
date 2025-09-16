-- lua/keymaps.lua

-- Leader key
vim.g.mapleader = " " -- space as leader

local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Window navigation
-----------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Move left
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Move right
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- Move down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- Move up

-----------------------------------------------------------
-- NvimTree (file explorer)
-----------------------------------------------------------
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus file tree" })
vim.keymap.set("n", "<leader>w", "<C-w>p", { desc = "Go back to previous window" })
-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-----------------------------------------------------------
-- Terminal mode
-----------------------------------------------------------
-- Exit terminal and go to NORMAL mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Focus back to editor (previous window) without killing process
vim.keymap.set("t", "<leader>e", [[<C-\><C-n><C-w>w]], opts)

-- Optional: toggle terminal (horizontal split)
vim.keymap.set("n", "<leader>tt", "<cmd>split | terminal<CR>", opts)

-----------------------------------------------------------
-- Quality of life
-----------------------------------------------------------
-- Save with Ctrl-s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", opts)

-- Quit with Ctrl-q
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)
