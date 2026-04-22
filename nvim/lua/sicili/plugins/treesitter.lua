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
    opts = {
        ensure_installed = {
            'c',
            'lua',
            'java',
            'javascript',
            'typescript',
            'glsl',
        },
    },
}
