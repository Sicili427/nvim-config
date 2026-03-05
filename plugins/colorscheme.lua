return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warmer",
            colors = {
                fg = "#e6e6e6",
                bg0 = "#1F1F1F",
            },

            code_style = {
                comments = 'none',
            },
        })

        require("onedark").load()
    end,
}
