local M = {}

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

function M.setup()
  npairs.setup {
    check_ts = true,
  }
end

return M
