return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim", -- must be listed here
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		-- Load ui-select extension
		telescope.load_extension("ui-select")
	end,
}
