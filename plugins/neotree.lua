---@type LazyPluginSpec
return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    branch = 'v3.x',
    ---@type neotree.Config
    opts = {
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
        },
        filesystem = {
            window = {
                mappings = {
                    ['<cr>'] = function (state)
                        local node = state.tree:get_node()
                        if (node.type == 'file') then
                            require('neo-tree.sources.common.commands').open(state);
                            require('neo-tree.command').execute({ action = 'focus' })
                        else
                            state.commands['open'](state)
                        end
                    end
                }
            }
        }
    },
    lazy = false,
}
