return {
	"stevearc/conform.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
				cpp = { "clang-format" },
				python = { "isort", "black" },
			},
			format_on_save = true, -- auto format when saving
		})

		-- Optional keymap: manual format
		vim.keymap.set("n", "<leader>cf", function()
			conform.format({ async = true })
		end, { desc = "Format current buffer" })
	end,
}
