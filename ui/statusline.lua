local function new_git_section(args)
    if MiniStatusline.is_truncated(args.trunc_width) then return "" end

    ---@type Gitsigns.StatusObj
    local git = vim.b.gitsigns_status_dict
    if not git then return '' end

    local branch = '%#GitBranch#%#MiniStatuslineDevinfo# ' .. git.head

    return branch
end

local function new_diff_section(args)
    if MiniStatusline.is_truncated(args.trunc_width) then return "" end

    ---@type Gitsigns.StatusObj
    local git = vim.b.gitsigns_status_dict
    if not git then return '' end

    local string_arr = {}

    if (git.added or 0) > 0 then table.insert(string_arr, '%#DiffAdded#+' .. git.added .. '%#MiniStatuslineDevinfo#') end
    if (git.changed or 0) > 0 then table.insert(string_arr, '%#DiffChanged#~' .. git.changed .. '%#MiniStatuslineDevinfo#') end
    if (git.removed or 0) > 0 then table.insert(string_arr, '%#DiffRemoved#-' .. git.removed .. '%#MiniStatuslineDevinfo#') end

    return #string_arr > 0 and ' ' .. table.concat(string_arr, ' ') or ''
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

local make_color = function(hl_fg, hl_bg)
    local fghl = vim.api.nvim_get_hl(0, { name = hl_fg })
    local bghl = vim.api.nvim_get_hl(0, { name = hl_bg })

    vim.api.nvim_set_hl(0, hl_fg .. '2', {
        fg = fghl.bg,
        bg = bghl.bg,
        force = true
    })
end

local combine_groups = function(groups)
    local parts = vim.tbl_map(function(s)
        if type(s) == 'string' then
            return s
        end
        if type(s) ~= 'table' then
            return ''
        end

        local string_arr = vim.tbl_filter(function(x)
            return type(x) == 'string' and x ~= ''
        end, s.strings or {})
        local str = table.concat(string_arr, ' ')

        -- Use previous highlight group
        if s.hl == nil then
            return ' ' .. str .. ' '
        end

        -- Allow using this highlight group later
        if str:len() == 0 then
            return '%#' .. s.hl .. '#'
        end

        return string.format('%%#%s#%s', s.hl, str)
    end, groups)

    return table.concat(parts, '')
end

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function ()
        local highlights = {
            'MiniStatuslineModeNormal',
            'MiniStatuslineModeInsert',
            'MiniStatuslineModeVisual',
            'MiniStatuslineModeReplace',
            'MiniStatuslineModeCommand',
            'MiniStatuslineModeOther',
            'MiniStatuslineDevinfo'
        }

        for _, hl in ipairs(highlights) do
            make_color(hl, 'MiniStatuslineFilename')
        end
    end
})

---@type LazyPluginSpec
return {
    "nvim-mini/mini.statusline",
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
                    local diff          = new_diff_section({ trunc_width = 75 })
                    local diagnostics   = new_diagnostics({ trunc_width = 75 })
                    local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local filename      = vim.fn.expand('%:.')
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location      = MiniStatusline.section_location({ trunc_width = 75 })

                    local tab = {
                        { hl = mode_hl .. '2', strings = { '█' } },
                        { hl = mode_hl, strings = { mode } },
                        { hl = mode_hl .. '2', strings = { '█' } },
                    }

                    if (git .. diff .. diagnostics .. lsp):len() > 0 then
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo2', strings = { '█' } } )
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } } )
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo2', strings = { '█' } } )
                    end

                    table.insert(tab, '%<')

                    table.insert(tab, { hl = 'MiniStatuslineFilename', strings = { ' ' .. filename .. ' ' } })

                    table.insert(tab, '%=')

                    if fileinfo:len() > 0 then
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo2', strings = { '█' } } )
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo', strings = { fileinfo } } )
                        table.insert(tab, { hl = 'MiniStatuslineDevinfo2', strings = { '█' } } )
                    end

                    table.insert(tab, { hl = mode_hl .. '2', strings = { '█' } } )
                    table.insert(tab, { hl = mode_hl, strings = { location } } )
                    table.insert(tab, { hl = mode_hl .. '2', strings = { '█' } } )

                    return combine_groups(tab)
                end,

                inactive = function ()
                    local git           = new_git_section({ trunc_width = 40 })
                    local filename      = vim.fn.expand('%:.')

                    return MiniStatusline.combine_groups({
                        { strings = { git } },
                        '%<',
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                    })
                end
            },
        })
    end
}
