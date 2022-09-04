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

  -- color schemes
  use 'folke/tokyonight.nvim'

  -- telescope fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'BurntSushi/ripgrep'},
      {'sharkdp/fd'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'},
      --{'nvim-telescope/telescope-media-files.nvim'},
      --{"nvim-telescope/telescope-symbols.nvim"},
      --{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    }
  }
end)
