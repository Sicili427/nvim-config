return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warmer",
            colors = {
                fg = "#e6e6e6",
                bg0 = "#141414",
            },

            code_style = {
                comments = 'none',
            },

            highlights = {
                MiniStatuslineFilename = { bg = '$bg0' },
                GitBranch = { fg = '$purple', bg = '$bg2' },
            }
        })

        require("onedark").load()
    end,
}
