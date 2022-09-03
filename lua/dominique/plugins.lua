-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn

-- BOOTSTRAP Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- misc
  use "windwp/nvim-autopairs"         -- automagically closes bracket and quote pairs
  use "akinsho/toggleterm.nvim"       -- toggle-able floating terminal

  -- nvim tree as file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- color schemes
  use 'folke/tokyonight.nvim'

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    }
  }

  -- languages
  use "folke/lua-dev.nvim"            -- useful for sumneko_lua LSP

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- code completion
  use "hrsh7th/nvim-cmp"              -- the completion plugin
  use "hrsh7th/cmp-buffer"            -- extension for buffer completions
  use "hrsh7th/cmp-path"              -- extension for path completions 
  use "hrsh7th/cmp-cmdline"           -- extension for command-line completions
  use "saadparwaiz1/cmp_luasnip"      -- extension for snippet completions
  use "hrsh7th/cmp-nvim-lsp"          -- extension for LSP completions in cmp

  -- telescope fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires= {
      'nvim-lua/plenary.nvim'
    }
  }

  -- snippets
  use "L3MON4D3/LuaSnip"              -- snippet engine, require by cmp
  use "rafamadriz/friendly-snippets"  -- a bunch of community curated snippets
end)
