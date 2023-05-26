local builtin = require 'telescope.builtin'


vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'search file' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,  { desc = 'search grep' })
vim.keymap.set('n', '<leader>ss', builtin.treesitter, { desc = 'search grep' })
