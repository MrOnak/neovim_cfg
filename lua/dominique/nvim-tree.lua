print("setting up nvim-tree")

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "case_sensitive",
  respect_buf_cwd = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  view = {
    adaptive_size = false,
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = {"l", "<CR>", "o"}, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
      },
    },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = require("dominique.glyphs").nvimtree
    },
    special_files = {"Makefile", "README.md"},
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 400,
  },
})
