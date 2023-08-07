local dap   = require('dap')
local dapui = require('dapui')

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' }
}

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
      dapui.open()
      dapui.toggle()
    end,
    after = function ()
        dap.repl.close()
        dapui.close()
        dapui.toggle()
    end
  },
}
