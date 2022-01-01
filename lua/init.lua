local map = vim.api.nvim_set_keymap
map('', '<M-f>', ':Telescope find_files <CR>',{})
map('', '<M-A>', ':NvimTreeToggle <CR>',{})

map('', '<M-E>', ':bp <CR>',{})
map('', '<M-R>', ':bn <CR>',{})



map('', '<C-h>', ':wincmd h<CR>',{})
map('', '<C-j>', ':wincmd j<CR>',{})
map('', '<C-k>', ':wincmd k<CR>',{})
map('', '<C-l>', ':wincmd l<CR>',{})

map('', '<C-s>', ':w <CR>',{})







vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Packer can manage itself
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
end)

local packer = require('packer')

 vim.opt.termguicolors = true

 packer.use {
       'nvim-lualine/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons', opt = true}
     }



packer.use {
     'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/plenary.nvim'},}
  }

packer.use { "nvim-telescope/telescope-file-browser.nvim" }

packer.use {   'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
  }
 packer.use {   'kyazdani42/nvim-tree.lua',
         requires = {
           'kyazdani42/nvim-web-devicons', -- optional, for file icon
         },
         config = function() require'nvim-tree'.setup {} end
     }

 require("bufferline").setup{}



 local tree_cb = require'nvim-tree.config'.nvim_tree_callback
 require'nvim-tree'.setup {
   update_cwd_on_find = true,
   git = {
     enable = false,
     ignore = false
   },
   view = {
     width = 60,
     mappings = {
       list = {
         { key = "d", cb = tree_cb("vsplit") },
         { key = "s", cb = tree_cb("split") },
         { key = "t", cb = tree_cb("tabnew") },
         { key = "W", cb = tree_cb("dir_up") },
       }
     }
   }
 }


 vim.api.nvim_set_keymap(
   "n",
   "<M-D>",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
 )


 local fb_actions = require "telescope".extensions.file_browser.actions
 local actions = require("telescope.actions")
 require("telescope").load_extension "file_browser"



 require('telescope').setup{
   defaults = {
   prompt_prefix = '🔍',
     initial_mode = 'normal',
     mappings = {
       [ 'n' ] = {
                 ["q"] = actions.close
         },
     }
   },
 }


 require'lualine'.setup {
   options = {
     -- icons_enabled = true,
     theme = 'everforest',
     component_separators = { left = '', right = ''},
     section_separators = { left = '', right = ''},
     disabled_filetypes = {},
     always_divide_middle = true,
   },
   sections = {
     lualine_a = {'mode'},
     lualine_b = {'branch', 'diff', 'diagnostics'},
     lualine_c = {'filename'},
     lualine_x = {'encoding', 'fileformat', 'filetype'},
     lualine_y = {'progress'},
     lualine_z = {'location'}
   },
   inactive_sections = {
     lualine_a = {},
     lualine_b = {},
     lualine_c = {'filename'},
     lualine_x = {'location'},
     lualine_y = {},
     lualine_z = {}
   },
   tabline = {},
   extensions = {}
 }

