return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<leader>t]], -- 🔥 Use <Space>t instead of Ctrl+\
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal", -- bottom panel like VS Code
			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- Optional extra keymaps
		vim.keymap.set(
			"n",
			"<leader>tv",
			"<cmd>ToggleTerm direction=vertical size=60<cr>",
			{ desc = "Vertical terminal" }
		)
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating terminal" })
	end,
}
