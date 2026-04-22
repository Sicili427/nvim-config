---@type LazyPluginSpec
return {
    "nvim-mini/mini.nvim",
    config = function()
        -- Load only the modules you want
        require('mini.ai').setup()
        require('mini.surround').setup()

        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader Commands
                { mode = 'n', keys = '<leader>' },
                { mode = 'n', keys = 'g' },
                -- Window Commands
                { mode = 'n', keys = '<C-w>' },

                { mode = 'n', keys = '['},
                { mode = 'n', keys = ']'},

                { mode = 'n', keys = 'z' },
            },

            clues = {
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },

            delay = 500,
        })
        require('mini.cursorword').setup()
    end
}
