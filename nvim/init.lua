----------------------------------------------
-------------- NEOVIM OPTIONS ----------------
----------------------------------------------

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sets Keymap Leader
vim.g.mapleader = ' '

------------ Lazy.nvim Startup ---------------
require("core.lazy")

----------- Keymaps On Startup ---------------
require("core.keymaps")

----------- Settings On Startup --------------
require("core.options")

------- Enable Treesitter Highlighting -------
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'java', 'javascript', 'jsx', 'typescript', 'glsl', },
  callback = function() vim.treesitter.start() end,
})
