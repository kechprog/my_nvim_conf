local dap = require('dap')

vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, { silent = true, desc = 'toggle_breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true, silent = true, desc = 'continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { noremap = true, silent = true, desc = 'step_into' })
vim.keymap.set('n', '<leader>ds', dap.run_last, { noremap = true, silent = true, desc = 'run_last' })

local dap_ui = require('dapui')

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",  -- This configuration will launch the current file you're editing
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.filereadable(cwd .. '/.venv/bin/python') then
        return cwd .. '/.venv/bin/python'
      elseif vim.fn.filereadable(cwd .. '/venv/bin/python') then
        return cwd .. '/venv/bin/python'
      else
        return '/usr/bin/python3'
      end
    end,
    before = function ()
      dap.repl.open()
      dap_ui.open()
    end,
    after = function ()
        dap.repl.close()
        dap_ui.close()
    end
  },
}

