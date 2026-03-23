----------------------------------------------
-------------- NEOVIM OPTIONS ----------------
----------------------------------------------

-- Sets Keymap Leader
vim.g.mapleader = ' '

------------ Lazy.nvim Startup ---------------
require("sicili.core.lazy")

----------- Keymaps On Startup ---------------
require("sicili.core.keymaps")

----------- Settings On Startup --------------
require("sicili.core.options")

------- Enable Treesitter Highlighting -------
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'java', 'javascript', 'jsx', 'typescript', 'glsl', },
  callback = function() vim.treesitter.start() end,
})
