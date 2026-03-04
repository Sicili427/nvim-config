----------------------------------------------
-------------- NEOVIM OPTIONS ----------------
----------------------------------------------

----------- Settings On Startup --------------
require("sicili.core.options")

require("sicili.core.lazy")

------- Enable Treesitter Highlighting -------
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'java', },
  callback = function() vim.treesitter.start() end,
})
