local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("dominique.lsp.lsp-installer")
require("dominique.lsp.handlers").setup()
