return {
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Load only the modules you want
            require("mini.statusline").setup()
            require("mini.icons").setup()
        end
    }
}
