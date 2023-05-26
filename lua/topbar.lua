require 'bufferline'.setup {
  animation = false,
  auto_hide = false,
  tabpages  = true,
  closable  = true,
  clickable = true,

  icons     = {

    buffer_index = false,
    buffer_number = false,
    button = '󰳭 ',

    separator = { left = '▎', right = '' },

    filetype = {
      enabled       = true,
      custom_colors = true,
    },


    gitsigns = {
      added = { enabled = true, icon = '+' },
      changed = { enabled = true, icon = '~' },
      deleted = { enabled = true, icon = '-' },
    },

    modified = {button = '●'},


    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = ' ' },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },

  },


  -- Configure icons on the bufferline.

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_start  = true,
  maximum_padding  = 1,
  minimum_padding  = 1,
  maximum_length   = 30,
  semantic_letters = true,
  letters          = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title    = nil,
}

local opts = { silent = true }
local map = vim.keymap.set
map('n', 'H', ':BufferPrevious<CR>', opts)
map('n', 'L', ':BufferNext<CR>', opts)
map('n', '<leader>c', ':BufferClose<CR>', opts)
