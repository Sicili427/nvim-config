return {
    'folke/lazydev.nvim',
    ft = 'lua',
    ---@type lazydev.Config
    opts = {
        library = {
            { path = 'lazy.nvim', words = { 'LazyPluginSpec', 'LazySpec', } },
            { path = 'lazydev.nvim', words = { 'lazydev', } },
            { path = 'gitsigns.nvim', words = { 'Gitsigns', 'gitsigns', } },
        }
    },
}
