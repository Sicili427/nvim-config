----------------------------------------------
-------------- NEOVIM OPTIONS ----------------
----------------------------------------------

----------- Settings On Startup --------------
require("sicili.core.options")

----------- Keymaps On Startup ---------------
require("sicili.core.keymaps")

------------ Lazy.nvim Startup ---------------
require("sicili.core.lazy")

------- Enable Treesitter Highlighting -------
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'java', },
  callback = function() vim.treesitter.start() end,
})
