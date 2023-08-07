local dap = require('dap')

-- Your existing key mappings
vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, { silent = true, desc = 'toggle_breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true, silent = true, desc = 'continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { noremap = true, silent = true, desc = 'step_into' })
vim.keymap.set('n', '<leader>dR', dap.run_last, { noremap = true, silent = true, desc = 'run_last' })

-- the main function that starts a debug session
vim.api.nvim_set_keymap('n', '<leader>dr', '<Cmd>lua require"dap".run({type = "python", request = "launch", program = "${file}"})<CR>', {noremap = true, silent = true})

require '_dap.dui'
require '_dap.py'
