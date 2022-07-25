return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- better keybindings
  use 'tpope/vim-sensible'
  --  use 'junegunn/seoul256.vim'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- Collection of common configurations for the Nvim LSP client
  use 'neovim/nvim-lspconfig'

  -- Snippet completion
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippet completion source for nvim-cmp
  use 'hrsh7th/cmp-vsnip'

  -- Other usefull completion sources
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  -- See hrsh7th's other plugins for more completion sources!

  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  use 'simrat39/rust-tools.nvim'

  -- Snippet engine
  use 'hrsh7th/vim-vsnip'

  -- Fuzzy finder
  -- Optional
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Color scheme used in the GIFs!
  use 'arcticicestudio/nord-vim'
  --
  --
  use 'folke/tokyonight.nvim'
  --
  -- Better nvim ui select
  use {'nvim-telescope/telescope-ui-select.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- not in use currently
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use 'lervag/vimtex'

  use 'vim-autoformat/vim-autoformat'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Tmux integration
  use 'vimpostor/vim-tpipeline'
end)
