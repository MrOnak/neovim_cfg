local status_lspc_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspc_ok then
  return
end

local status_mason_ok, mason = pcall(require, "mason")
if not status_mason_ok then
  return
end

print("  setting up...")

print("  - Mason")
mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = "single",   -- accepts same border values as nvim_open_win().
    icons = require("dominique.glyphs").mason
  }
})

print("  - LSPconfig")

print("  - LSP language handlers")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- setup all language servers, supply them with above configuration
-- ================================================================
lspconfig["bashls"].setup {on_attach = on_attach, flags = lsp_flags} -- attaches
-- clangd wasn't installed through Mason since it couldn't find the right binary for ARM (installed thru apt)
lspconfig["clangd"].setup {on_attach = on_attach, flags = lsp_flags} -- attaches
lspconfig["cssls"].setup {on_attach = on_attach, flags = lsp_flags}
lspconfig["dotls"].setup {on_attach = on_attach, flags = lsp_flags} -- attaches
lspconfig["html"].setup {on_attach = on_attach, flags = lsp_flags}
lspconfig["jsonls"].setup {on_attach = on_attach, flags = lsp_flags} -- attaches
lspconfig["sumneko_lua"].setup {on_attach = on_attach, flags = lsp_flags}
-- markdown
lspconfig["tsserver"].setup {on_attach = on_attach, flags = lsp_flags}
lspconfig["yamlls"].setup {on_attach = on_attach, flags = lsp_flags}

