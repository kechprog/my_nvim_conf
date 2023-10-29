vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.wo.foldmarker = "[ , ]"
vim.wo.foldmethod = "manual"

-- https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save/37558470#37558470
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
  augroup END
]]

local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4


vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set cmdheight=0")


-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jk', '<esc>', {silent = true})
vim.keymap.set('n', '<leader>w', ':w<cr>', {silent=true})
vim.keymap.set('n', '<leader>q', ':q<cr>', {silent=true})
vim.keymap.set('v', '>', '>gv', {silent=true})
vim.keymap.set('v', '<', '<gv', {silent=true})
vim.keymap.set("v", "J", ":m .+1<CR>==gv", {silent=true})
vim.keymap.set("v", "K", ":m .-2<CR>==gv", {silent=true})
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-wh>', {silent = true})

vim.keymap.set('n', '<leader>zf', 'za', {noremap = true})

vim.o.guifont = "FiraCode Nerd Font:h18"


local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
