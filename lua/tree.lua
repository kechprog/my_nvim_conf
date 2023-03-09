require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', 'c', api.fs.copy.relative_path)
-- vim.keymap.set('n', 'n', api.fs.create)
-- vim.keymap.set('n', 'r', api.fs.rename)

