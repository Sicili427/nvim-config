vim.lsp.config('jdtls', {
    root_markers = {  '.root', 'mvnw', 'gradlew', 'settings.gradle', 'settings.gradle.kts', '.git', 'build.xml', 'pom.xml', 'build.gradle', 'build.gradle.kts' }
})

return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        {
            "mason-org/mason.nvim",
        },
        {
            "neovim/nvim-lspconfig",
        },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            automatic_installation = true,
    })
    end,
}
