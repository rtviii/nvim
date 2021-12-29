


local map = vim.api.nvim_set_keymap
map('', '<M-f>', ':Telescope find_files <CR>',{})
map('', '<M-D>', ':Telescope file_browser <CR>',{})
map('', '<C-s>', ':w <CR>',{})


-- [[
-- ===============Packer==============
-- ]]

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

        use 'junegunn/vim-easy-align'


	use 'tpope/vim-surround'



    end
)

use {
      'nvim-telescope/telescope.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
      }
}

use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
}

-- [[
-- ===============Packer==============
-- ]]






local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
  prompt_prefix = '🔍',
    initial_mode = 'normal',
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      },
      n = {
                ["q"] = actions.close
        },
    }
  },

  pickers = {
      file_browser={

            initial_mode = 'normal',
            cwd          = require("telescope.utils").buffer_dir(),
          }
      }
}



