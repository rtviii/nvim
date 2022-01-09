
require('packer').startup(function()
  -- Packer can manage itself
      use 'folke/tokyonight.nvim'
      use 'arcticicestudio/nord-vim'
      use 'wbthomason/packer.nvim'
      use 'joshdick/onedark.vim'
      use 'junegunn/vim-easy-align'
      use 'tpope/vim-surround'
      use 'nvim-treesitter/nvim-treesitter'
      use 'glepnir/lspsaga.nvim'
      use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
      use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
      use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
      use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
      use 'L3MON4D3/LuaSnip' -- Snippets plugin


use {
       'nvim-lualine/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons', opt = true}
     }



use {

     'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/plenary.nvim'},}

  }

use { "nvim-telescope/telescope-file-browser.nvim" }

use { 'akinsho/bufferline.nvim',

      requires = 'kyazdani42/nvim-web-devicons'

  }

 use {   'kyazdani42/nvim-tree.lua',
         requires = {
           'kyazdani42/nvim-web-devicons', -- optional, for file icon
         },
         config = function() require'nvim-tree'.setup {} end
     }
end)

