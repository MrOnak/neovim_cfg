local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

print("setting up telescope")

-- ==============================================================================
--   LOAD EXTENSIONS
-- ==============================================================================
-- this won't work because to my understanding lua FFI isn't available for ARM :(
-- needs more research
telescope.load_extension('fzf')
telescope.load_extension('media_files')
--telescope.load_extension('fzy_native')

-- ==============================================================================
--   TELESCOPE SETUP
-- ==============================================================================
telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
--[[
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
--]]
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

