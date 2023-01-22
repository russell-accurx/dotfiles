vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local bootstrap = require "bootstrap".ensure_packer()

local config = function (plugin)
  return string.format('require("setup/%s")', plugin)
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhartington/oceanic-next'
  use {'dag/vim-fish', ft = {"fish"} }
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'qpkorr/vim-renamer'

  use {
    'windwp/nvim-autopairs',
    config = config("autopairs")
  }

  use 'windwp/nvim-ts-autotag'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = config("treesitter")
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
    config = config("telescope")
  }

  use {
    'neovim/nvim-lspconfig',
    config = config("lsp")
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-telescope/telescope-smart-history.nvim',
    requires = {'kkharji/sqlite.lua'}
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = config("neotree")
  }

  use {
    'hrsh7th/nvim-cmp', 
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-git',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'mtoohey31/cmp-fish'

    },
    config = config("cmp")
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = config("prettierd")
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
