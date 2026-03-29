local set = vim.o

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
    virtual_text = true,
    underline = false,
    update_in_insert = false
})
