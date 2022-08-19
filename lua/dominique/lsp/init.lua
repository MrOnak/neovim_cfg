local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("dominique.lsp.lsp-installer")
--require("dominique.lsp.handlers").setup()

local servers = {
--  bashls = {},
--  html = {},
--  jsonls = {},
  sumneko_lua = {},
}

local options = {
  flags = {
    debounce_text_changes = 150
  }
}

require("dominique.lsp.mason")
require("dominique.lsp.mason-tool-installer")
require("dominique.lsp.mason-lspconfig")

