return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {}, -- default options
  cmd = "TroubleToggle",
  keys = {
    {
      "<leader>xx",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>TroubleToggle symbols<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>TroubleToggle lsp_definitions<cr>",
      desc = "LSP Definitions",
    },
    {
      "<leader>xL",
      "<cmd>TroubleToggle loclist<cr>",
      desc = "Location List",
    },
    {
      "<leader>xQ",
      "<cmd>TroubleToggle quickfix<cr>",
      desc = "Quickfix List",
    },
  },
}
