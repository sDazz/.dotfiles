-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lualine/lualine.nvim"
  -- telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
--harpoon
  use {
    'ThePrimeagen/harpoon'
  }

  --latex
  use 'lervag/vimtex'

  ----lspthings
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  --use 'p00f/clangd_extensions.nvim'

  ----luasnip
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }

  --themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use 'folke/tokyonight.nvim'
  use { "nvim-treesitter/nvim-treesitter" }
  use { "/nvim-treesitter/nvim-treesitter-context"}

  --vim-be-good


end)

