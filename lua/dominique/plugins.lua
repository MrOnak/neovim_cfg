-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- misc
  use "nvim-lua/plenary.nvim" -- useful lua functions used by lots of plugins

  -- color schemes
  use 'folke/tokyonight.nvim'

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

  -- LSP
  use "neovim/nvim-lspconfig"         -- enable LSP
  use "williamboman/mason.nvim"       -- updated package installer, superseeds lsp installer
end)
