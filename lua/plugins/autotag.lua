return {
    'windwp/nvim-autopairs',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',  -- Required for autotag
        'windwp/nvim-ts-autotag',
    },
    config = function()
        -- Autopairs setup
        require('nvim-autopairs').setup({
            check_ts = true,  -- use treesitter to check for pairs
            enable_check_bracket_line = true,
        })

        -- Autotag setup for HTML, JSX, TSX, etc.
        require('nvim-ts-autotag').setup({
            filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "svelte", "vue" }
        })
    end,
}

