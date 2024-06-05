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

vim.cmd [[
  set laststatus=0
  hi! link StatusLine Normal
  hi! link StatusLineNC Normal
  set statusline=%{repeat('─',winwidth('.'))}
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
vim.keymap.set('i', 'jk', '<esc>', { silent = true })
vim.keymap.set('n', '<leader>w', ':silent w<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', ':silent q<cr>', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })

vim.api.nvim_set_keymap('x', 'K', [[:move '<-2<CR>gv=gv]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', [[:move '>+1<CR>gv=gv]], { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-wh>', { silent = true })


local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
