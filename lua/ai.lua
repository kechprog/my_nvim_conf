-- local gen = require 'ogpt'

local function nmap(keys, func, bufnr, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- nmap("<leader>os", gen.select_model, nil, "[o]llama [s]elect")
-- nmap("<leader>og", ":Gen Generate<cr>", nil, "[o]llama [g]en")
