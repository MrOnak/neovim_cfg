local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    border = "single",
    icons = {
      package_installed = "/",
      package_pending = "?",
      package_uninstalled = "x"
    },
    keymaps = {
      toggle_package_expand = "<CR>",   -- expand a package
      install_package = "i",            -- install the package under the current cursor position
      update_package = "u",             -- reinstall/update the package under the current cursor position
      check_package_version = "c",      -- check for new version for the package under the current cursor position
      update_all_packages = "U",        -- update all installed packages
      check_outdated_packages = "C",    -- check which installed packages are outdated
      uninstall_package = "X",          -- uninstall a package
      cancel_installation = "<C-c>",    -- cancel a package installation
      apply_language_filter = "<C-f>",  -- apply language filter
    }
  }
})
