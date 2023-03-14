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
vim.keymap.set('n', 'r', function()
  if vim.bo.filetype == 'NvimTree' then
    tree_api.fs.rename()
  end
end)
vim.keymap.set('n', 'd', function()
  if vim.bo.filetype == 'NvimTree' then
    tree_api.fs.delete()
  end
end)
vim.keymap.set('n', 'n', function()
  if vim.bo.filetype == 'NvimTree' then
    tree_api.fs.create()
  end
end)
-- make a keymap which unfocusses tree if inside the tree 
-- and focuses on tree if not focused
vim.keymap.set('n', '<leader>E', function()
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd p')
  else
    vim.cmd('NvimTreeFocus')
  end
end)
