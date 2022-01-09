local map = vim.api.nvim_set_keymap
vim.cmd('packadd packer.nvim')

require('plugins')
require('browser')


map('', '<M-f>', ':Telescope find_files <CR>',{})
map('', '<M-A>', ':NvimTreeToggle <CR>',{})

map('', '<M-E>', ':bp <CR>',{})
map('', '<M-R>', ':bn <CR>',{})



map('', '<C-h>', ':wincmd h<CR>',{})
map('', '<C-j>', ':wincmd j<CR>',{})
map('', '<C-k>', ':wincmd k<CR>',{})
map('', '<C-l>', ':wincmd l<CR>',{})

map('', '<C-s>', ':w <CR>',{})


--[[
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
end)

local packer = require('packer')


packer.use {
       'nvim-lualine/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons', opt = true}
     }



packer.use {

     'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/plenary.nvim'},}

  }

packer.use { "nvim-telescope/telescope-file-browser.nvim" }

packer.use { 'akinsho/bufferline.nvim',

      requires = 'kyazdani42/nvim-web-devicons'

  }

 packer.use {   'kyazdani42/nvim-tree.lua',
         requires = {
           'kyazdani42/nvim-web-devicons', -- optional, for file icon
         },
         config = function() require'nvim-tree'.setup {} end
     }

 --]]
 --
 --
 --
 --
 --
     -------------------------- LSP

require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {

    ['<A-k>'] = cmp.mapping.select_prev_item(),
    ['<A-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


     --
     -- Completion



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
     theme = 'tokyonight',
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

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
