local status_mason_ok, mason = pcall(require, "mason")
if not status_mason_ok then
  return
end

print("- diagnostics")
-- use nerdfont glyphs
local signs = require("dominique.glyphs").lsp_diagnostics

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
end

-- general config
vim.diagnostic.config({
  severity_sort = true, -- this ensures that the highest level glyph is shown
  underline = true,     -- underlines offending part of the line
  virtual_text = false, -- use <leader>ll to show the diagnostics
  signs = {
    active = signs
  },
  float = {
    border = "single",
    source = "if_many", -- only show source of error detection if there's more than one
  }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

print("- Mason")
mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = "single", -- accepts same border values as nvim_open_win().
    icons = require("dominique.glyphs").mason
  }
})


