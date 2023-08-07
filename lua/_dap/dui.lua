local dapui = require('dapui')

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = { -- Remap for dapui
    expand = {"<CR>", "<2-LeftMouse>"},
    open = "o",
    remove = "d",
    edit = "e",
  },
  sidebar = {
    open_on_start = true,
    elements = {
      -- Provide as-space element that render file name
      { id = 'scopes', size = 0.25 },
      -- Provide a no-space element which renders breakpoints
      { id = 'breakpoints', size = 0.25 },
    },
  },
  tray = {
    open_on_start = true,
    elements = {
      'repl'
    },
  },
  floating = {
    max_height = nil,      -- These can be integers or a float between 0 and 1.
    max_width = nil,       -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
