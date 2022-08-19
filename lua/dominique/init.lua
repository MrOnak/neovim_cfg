--neovim general configuration
require("dominique.options")
-- cmp code completion
require("dominique.cmp")
-- language server protocol
require("dominique.lsp").setup()
-- auto-closing of brackets and quotes
require("dominique.autopairs").setup()
