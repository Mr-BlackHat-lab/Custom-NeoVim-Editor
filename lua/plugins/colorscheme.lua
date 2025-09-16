return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- make background transparent
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
        },
        custom_highlights = function(colors)
          return {
            Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
            LineNr = { fg = "#F5F5F5" },           -- whitesmoke for regular line numbers
            CursorLineNr = { fg = "#FFB6C1", bold = true }, 

          }
        end,
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

