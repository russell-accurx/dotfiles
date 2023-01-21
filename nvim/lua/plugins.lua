vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local bootstrap = require "bootstrap".ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'dag/vim-fish'
  use 'mhartington/oceanic-next'
  use 'qpkorr/vim-renamer'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-smart-history.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-tree/nvim-web-devicons'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-git'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'mtoohey31/cmp-fish'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-neo-tree/neo-tree.nvim'
  use 'kkharji/sqlite.lua'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
