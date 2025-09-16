return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					group_empty = true,
					highlight_git = true,
					highlight_opened_files = "all",
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},
}
