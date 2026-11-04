require("vim-options")
require("config.lazy")
require("lazy").setup("plugins")

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })
