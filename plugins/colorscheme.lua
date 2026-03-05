return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warmer",
            colors = {
                fg = "#e6e6e6",
                bg0 = "#0d0d11",
            },
        })

        require("onedark").load()
    end,
}
