local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, { silent = true, noremap = true, desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dt', dapui.toggle,          { silent = true, noremap = true, desc = 'Toggle UI'         })

-- python config
local python_path = function()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  else
    return '/usr/bin/python'
  end
end

require('dap-python').setup(python_path())
