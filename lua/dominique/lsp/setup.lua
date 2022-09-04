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


