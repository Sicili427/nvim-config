return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = 'master',
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                max_lines = 4,
                multiline_threshold = 2,
            },
        },
    },
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            'lua',
            'c',
            'java',
            'glsl',
            'javascript',
            'typescript',
        })
    end,
}
