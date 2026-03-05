return {
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Load only the modules you want
            require("mini.icons").setup()
            require("mini.statusline").setup()
        end
    }
}
