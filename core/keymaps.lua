-- Function for defining keymaps
local function map(mode, key, cmd, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, key, cmd, opts)
end

-- Set Global Leader Key --
vim.g.mapleader = " "

-- Neovim Keymaps
map("i", "jj", "<Esc>l", { desc = "Exit normal mode"})

-- LSP Keymaps
map("n", "<leader>of", function() vim.diagnostic.open_float() end, { desc = "[O]pen [F]loat"})
map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic"})
map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic"})
