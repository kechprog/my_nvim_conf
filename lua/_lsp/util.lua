local M = {}

function M.nmap(keys, func, bufnr, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

function M.common_on_attach(_client, bufnr)
  local builtin = require 'telescope.builtin'

  M.nmap('<leader>lr', vim.lsp.buf.rename, bufnr, '[R]e[n]ame')
  M.nmap('<leader>la', vim.lsp.buf.code_action, bufnr, '[C]ode [A]ction')
  M.nmap('<leader>ld', builtin.diagnostics, bufnr, '[d]iagnostics)')
  M.nmap('gd', builtin.lsp_definitions,      bufnr, '[G]oto [D]efinition')

  --TODO: make gr call lsp_incoming_calls if thing under cursor is function/method
  M.nmap('gr', builtin.lsp_references,      bufnr, '[G]oto [R]eferences')
  M.nmap('gi', builtin.lsp_implementations, bufnr, '[G]oto [I]mplementation')
  M.nmap('gm', builtin.lsp_outgoing_calls,  bufnr, '[G]oto [C]alls (outgoing)')
  M.nmap('gD', vim.lsp.buf.type_definition, bufnr, 'Type [D]efinition')

  M.nmap('K', vim.lsp.buf.hover, bufnr, 'Hover Documentation')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ options = { tabSize = vim.o.tabstop } })
  end, { desc = 'Format current buffer with LSP' })
end

return M
