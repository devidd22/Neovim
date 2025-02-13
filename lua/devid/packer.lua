

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",		
    'hrsh7th/nvim-cmp',           -- Completion Plugin
    'hrsh7th/cmp-nvim-lsp',       -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',         -- Buffer completions
    'hrsh7th/cmp-path',           -- Path completions
    'hrsh7th/cmp-cmdline',        -- Command line completions
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-nvim-lsp-signature-help' -- Show function signatures
  }
  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },

        sources = {
          { name = 'luasnip' },
          -- more sources
        },
      }
    end
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { "sitiom/nvim-numbertoggle" }
  use "rafamadriz/friendly-snippets"
  --use { 'nvim-lua/plenary.nvim' }
 
  --harpoon
  use { 'ThePrimeagen/harpoon' }
  --undotree
  use 'mbbill/undotree'

end)

