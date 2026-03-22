-- Function for defining keymaps
local function map(mode, key, cmd, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, key, cmd, opts)
end

-- Neovim Keymaps
map("i", "jj", "<Esc>l", { desc = "Exit normal mode"})
map('n', '<leader>nh', function() vim.cmd('noh') end, { desc = '[N]o [H]ighlight' })

-- LSP Keymaps
map("n", "<leader>of", function() vim.diagnostic.open_float() end, { desc = "[O]pen [F]loat"})
map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic"})
map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic"})

-- Telescope Keymaps
local telescope = require('telescope.builtin')

map('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>lg', telescope.live_grep, { desc = '[L]ive [G]rep' })
