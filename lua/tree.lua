require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local tree_api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', 'c', tree_api.fs.copy.relative_path)
vim.keymap.set('n', '<leader>E', function()
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd p')
  else
    vim.cmd('NvimTreeFocus')
  end
end)
