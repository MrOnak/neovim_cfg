print("nvim-tree")

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "case_sensitive",
  respect_buf_cwd = false,
  view = {
    adaptive_size = true,
    side = "left",
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
    },
--[[
    glyphs = {
      default = "",
      symlink = "",
      bookmark = "",
      folder = {
        arrow_closed = "",
        arrow_open = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
      },
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
      },
    },
]]
  },
  filters = {
    dotfiles = false,
  },
})
