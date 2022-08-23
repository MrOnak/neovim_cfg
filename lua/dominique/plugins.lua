-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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

  -- languages
  use "folke/lua-dev.nvim"            -- useful for sumneko_lua LSP

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- required for live-grep (sudo apt install fd-find)
      "sharkdp/fd",
      -- faster grep, required by Telescope.live_grep (sudo apt install ripgrep)
      "BurntSushi/ripgrep",
      -- performance improvements for telescope sorts
      {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
    },
  }

  -- LSP
  use "neovim/nvim-lspconfig"         -- enable LSP
  use "williamboman/mason.nvim"       -- updated package installer, superseeds lsp installer
  use "williamboman/mason-lspconfig.nvim"
  use "WhoIsSethDaniel/mason-tool-installer.nvim"

  -- code completion
  use "hrsh7th/nvim-cmp"              -- the completion plugin
  use "hrsh7th/cmp-buffer"            -- extension for buffer completions
  use "hrsh7th/cmp-path"              -- extension for path completions 
  use "hrsh7th/cmp-cmdline"           -- extension for command-line completions
  use "saadparwaiz1/cmp_luasnip"      -- extension for snippet completions
  use "hrsh7th/cmp-nvim-lsp"          -- extension for LSP completions in cmp

  -- snippets
  use "L3MON4D3/LuaSnip"              -- snippet engine, require by cmp
  use "rafamadriz/friendly-snippets"  -- a bunch of community curated snippets
end)
