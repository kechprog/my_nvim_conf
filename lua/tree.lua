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
vim.keymap.set('n', '<leader>e', tree_api.tree.toggle, { desc = 'toggle tree' })

vim.keymap.set('n', '<leader>E', function()
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd p')
  else
    vim.cmd('NvimTreeFocus')
  end
end, { noremap = true, silent = true, desc = 'jump back to tree' })

vim.keymap.set('n', 'n', function ()
    if vim.bo.filetype == 'NvimTree' then
      tree_api.fs.create()
    else
        vim.cmd('normal! n')
    end
end , { noremap = true, silent = true, desc = 'create a new file/dir in tree' })

vim.keymap.set('n', 'c', function ()
  if vim.bo.filetype == 'NvimTree' then
    tree_api.fs.copy()
  else
    vim.cmd('normal! c')
  end
end, { noremap = true, silent = true, desc = 'copy path of thing under cursor' })
