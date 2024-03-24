---@diagnostic disable: missing-fields
vim.loader.enable()
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
--]]

---------------------   PACKEGES   ---------------------
require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'VonHeikemen/lsp-zero.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },


  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' }
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
    }
  },

  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { "nvim-neotest/nvim-nio" },
  },

  'onsails/lspkind.nvim',
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip' },
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' }
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
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

  "ray-x/go.nvim",

  {
    -- Theme inspired by Atom
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
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
  },

  { 'numToStr/Comment.nvim',         opts = {} },
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'romgrk/barbar.nvim',
  'windwp/nvim-autopairs',
  'akinsho/toggleterm.nvim',
  'folke/todo-comments.nvim',
  {
    'startup-nvim/startup.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}, {})

require '_ibl'
require '_startup' -- has to be almost first, it is an actual startup thing
require '_dap.init'
require 'tree'     -- file explorer actually needs some setup and then
require 'nvim_stock'
require '_telescope'
require 'treesitter'
require 'cmp_conf'
require '_lsp'
require 'coment'
require 'topbar'
require('nvim-autopairs').setup {}
require 'term'
require 'todo-comment'
require '_leap'
