local function new_git_section(args)
    if MiniStatusline.is_truncated(args.trunc_width) then return "" end

    ---@type Gitsigns.StatusObj
    local git = vim.b.gitsigns_status_dict
    if not git then return "" end

    local branch = '%#GitBranch#%#MiniStatuslineDevinfo# ' .. git.head
    local added = (git.added or 0) > 0 and '%#GitAdded#+' .. git.added .. ' ' or ''
    local changed = (git.changed or 0) > 0 and '%#GitChanged#~' .. git.changed .. ' ' or ''
    local removed = (git.removed or 0) > 0 and '%#GitRemoved#-' .. git.removed .. ' ' or ''

    if added == '' and changed == '' and removed == '' then return branch end

    return branch .. '  ' .. added .. changed .. removed
end

local function new_diagnostics(args)
    if MiniStatusline.is_truncated(args.trunc_width) then return '' end

    local counts = vim.diagnostic.count(0)

    local errors = counts[vim.diagnostic.severity.ERROR] or 0
    local warnings = counts[vim.diagnostic.severity.WARN] or 0

    if errors == 0 and warnings == 0 then return '' end

    return ' '.. (errors > 0 and '%#DiagnosticError#E' .. errors .. ' ' or '')
    .. (warnings > 0 and '%#DiagnosticWarn#W' .. warnings .. ' ' or '')
end

---@type LazyPluginSpec
return {
    "echasnovski/mini.nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
    },
    config = function()
        -- Load only the modules you want
        require("mini.statusline").setup({
            content = {
                active = function ()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git           = new_git_section({ trunc_width = 40 })
                    local diagnostics   = new_diagnostics({ trunc_width = 75 })
                    local filename      = vim.fn.expand('%:.')
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
                    local location      = MiniStatusline.section_location({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl,                  strings = { mode } },
                        { hl = 'MiniStatuslineDevinfo',  strings = { '' } },
                        { strings = { git, diagnostics } },
                        '%<',
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%=',
                        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                        { hl = mode_hl,                  strings = { search, location } },
                    })
                end
            },
        })
    end
}
