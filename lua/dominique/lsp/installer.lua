local M = {}

print("lsp/installer")

function M.setup(servers, options)
  local lspconfig = require "lspconfig"
--  local icons = require "config.icons"

  print("  mason")
  require("mason").setup {
    ui = {
      border = "single",
      icons = require("dominique.glyphs").mason,
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
    },
  }

  print("  mason-tool-installer")
  require("mason-tool-installer").setup {
    ensure_installed = {
      -- "codelldb", 
      -- "stylua", 
      -- "shfmt", 
      -- "shellcheck", 
      -- "black", 
      -- "isort", 
      -- "prettierd" 
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000,
  }

  print("  mason-lspconfig")
  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }

  -- Package installation folder
  local install_root_dir = vim.fn.stdpath "data" .. "/mason"

  print("  mason-lspconfig.setup_handlers")
  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup { opts }
    end,
    --[[
    ["jdtls"] = function()
      -- print "jdtls is handled by nvim-jdtls"
    end,
    --]]
    ["sumneko_lua"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
      lspconfig.sumneko_lua.setup(require("lua-dev").setup { opts })
    end,
    --[[
    ["rust_analyzer"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["rust_analyzer"] or {})

      -- DAP settings - https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
      local extension_path = install_root_dir .. "/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      require("rust-tools").setup {
        tools = {
          autoSetHints = false,
          executor = require("rust-tools/executors").toggleterm,
          hover_actions = { border = "solid" },
          on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
              pattern = { "*.rs" },
              callback = function()
                vim.lsp.codelens.refresh()
              end,
            })
          end,
        },
        server = opts,
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
    ["tsserver"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
      require("typescript").setup {
        disable_commands = false,
        debug = false,
        server = opts,
      }
    end,
    --]]
  }
end

return M
