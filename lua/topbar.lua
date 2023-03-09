require 'bufferline'.setup {
  animation               = true,
  auto_hide               = false,
  tabpages                = true,
  closable                = true,
  clickable               = true,

  diagnostics             = {
    -- you can use a list
    { enabled = true, icon = 'ﬀ' }, -- ERROR
    { enabled = false }, -- WARN
    { enabled = false }, -- INFO
    { enabled = true }, -- HINT

    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
    [vim.diagnostic.severity.WARN] = { enabled = false },
    [vim.diagnostic.severity.INFO] = { enabled = false },
    [vim.diagnostic.severity.HINT] = { enabled = true },
  },

  icons                   = true,

  icon_custom_colors      = false,

  -- Configure icons on the bufferline.
  icon_separator_active   = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab          = '',
  icon_close_tab_modified = '●',
  icon_pinned             = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_start         = true,
  maximum_padding         = 1,
  minimum_padding         = 1,
  maximum_length          = 30,
  semantic_letters        = true,
  letters                 = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title           = nil,
}

local opts = {silent = true}
local map = vim.keymap.set
map('n', 'H', ':BufferPrevious<CR>', opts)
map('n', 'L', ':BufferNext<CR>',     opts)
map('n', '<leader>c', ':BufferClose<CR>', opts)
