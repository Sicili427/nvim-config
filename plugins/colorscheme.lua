return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                theme = "wave",
                keywordStyle = { italic = false },
                background = {
                    dark = "wave",
                },
            })

            vim.cmd("colorscheme kanagawa")
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        config = function()
            require("onedark").setup({
                style = "darker",
            })
        end,
    },
}
