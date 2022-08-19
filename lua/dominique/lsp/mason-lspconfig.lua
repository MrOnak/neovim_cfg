local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

print("setting up mason-lspconfig")

local servers = {
--  bashls = {},
--  html = {},
--  jsonls = {},
  sumneko_lua = {},
}

local options = {
  flags = {
    debounce_text_changes = 150
  }
}

mason_lspconfig.setup({
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {}, --vim.tbl_keys(servers),

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = false,
})

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
    lspconfig[server_name].setup { opts }
  end,
  ["sumneko_lua"] = function()
    print("  language servers: lua is handled by sumneko_lua")
    local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
    -- lspconfig.sumneko_lua.setup(require("lua-dev").setup { opts })
  end
--[[
--]]
}
