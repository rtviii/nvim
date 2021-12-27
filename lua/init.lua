


vim.api.nvim_set_keymap('', '<M-f>', ':Telescope find_files <CR>',{})
vim.api.nvim_set_keymap('', '<M-D>', ':Telescope file_browser <CR>',{})
-- Save on Ctrl+s in normal  & insert
vim.api.nvim_set_keymap('', '<C-s>', ':w <CR>',{})


packer= require 'packer'
packer.init {
	display = {
		open_fn = require('packer.util').float,
		show_all_info = true
		}
}


local use = packer.use

packer.startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'joshdick/onedark.vim'
        use 'nvim-treesitter/nvim-treesitter'
        use { 'nvim-telescope/telescope-project.nvim' }
    end
)

use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
}




require('telescope').setup{
  defaults = {
    initial_mode = "normal",
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
}
