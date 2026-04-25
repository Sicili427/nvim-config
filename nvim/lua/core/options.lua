local set = vim.opt

-- line number options
set.number = true
set.relativenumber = true

-- indentation settings
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.smarttab = true
set.preserveindent = true

-- folding settings
set.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
set.foldmethod = 'expr'
set.foldenable = false

-- sets margin below cursor when scrolling
set.scrolloff = 12
set.sidescrolloff = 20

-- turn off line wrap
set.wrap = false

-- diagnostic config
---@type vim.diagnostic.Opts
vim.diagnostic.config({
    virtual_text = true;
    underline = false,
    update_in_insert = false
})

-- filetype config
vim.filetype.add({
    extension = {
        tmux = 'tmux',
    }
})

-- clipboard config
set.clipboard = 'unnamedplus'

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }

    vim.keymap.set({"n", "v"}, "y", '"+y', { noremap = true, silent = true })
    vim.keymap.set({"n", "v"}, "p", '"+p', { noremap = true, silent = true })
end
