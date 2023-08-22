local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>sf', builtin.find_files,                    { desc = '[s]earch file'                })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,                     { desc = '[s]earch grep'                })
vim.keymap.set('n', '<leader>sS', builtin.lsp_dynamic_workspace_symbols, { desc = '[s]earch Workspace [S]ymbols' })
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols,          {desc = '[D]ocument [S]ymbols'          })
