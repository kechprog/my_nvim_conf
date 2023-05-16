vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---------------------   PACKEGE MANAGER INSSTALL  ---------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


--[[
-- TODO:
-- debugger setup
-- inpatient
--]]

---------------------   PACKEGES   ---------------------
require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
  },

  'onsails/lspkind.nvim',
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-path' },
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' }
  },

  { 'ggandor/leap.nvim',
    dependencies = {'tpope/vim-repeat'}
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { "elkowar/yuck.vim" },
  { -- Theme inspired by Atom
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        styles = {
          comments  = { 'italic' },
          functions = { 'bold' },
          keywords  = { 'bold' },
          variables = { 'italic' },
          types     = { 'bold' },
        },
      }
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines239, 222, 205
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '|',
      show_trailing_blankline_indent = false,
    },
  },

  { 'numToStr/Comment.nvim',         opts = {} },
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'romgrk/barbar.nvim',
  'windwp/nvim-autopairs',
  'akinsho/toggleterm.nvim',
  'glepnir/dashboard-nvim',
  'folke/todo-comments.nvim',

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}, {})


require 'nvim_stock'
require '_telescope'
require 'treesitter'
require 'cmp_conf'
require 'lsp_conf'
require 'coment'
require 'tree'
require 'topbar'
require('nvim-autopairs').setup {}
require 'term'
require 'greater'
require 'todo-comment'
require '_leap'
