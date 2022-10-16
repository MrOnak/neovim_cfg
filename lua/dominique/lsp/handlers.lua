local status_lspc_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspc_ok then
  return
end
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

print("LSP language handlers")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- setup all language servers, supply them with above configuration
-- ================================================================
-- shell script
lspconfig["bashls"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- clangd wasn't installed through Mason since it couldn't find the right binary for ARM (installed thru apt)
-- c/c++/...
lspconfig["clangd"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
lspconfig["cssls"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- dot / graphviz
lspconfig["dotls"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
lspconfig["html"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- json
lspconfig["jsonls"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- ruby
lspconfig["solargraph"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
lspconfig["sumneko_lua"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- markdown missing
lspconfig["tsserver"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- yaml
lspconfig["yamlls"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
