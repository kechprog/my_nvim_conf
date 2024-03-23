local lspz = require('lsp-zero').preset({})
local builtin = require 'telescope.builtin'
lspz.extend_lspconfig()

local on_attach = function(_client, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>lr', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>ld', builtin.diagnostics, '[d]iagnostics)')

  nmap('gd', vim.lsp.buf.definition,      '[G]oto [D]efinition')
  --TODO: make gr call lsp_incoming_calls if thing under cursor is function/method
  nmap('gr', builtin.lsp_references,      '[G]oto [R]eferences')
  nmap('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
  nmap('gm', builtin.lsp_outgoing_calls,  '[G]oto [C]alls (outgoing)')
  nmap('gD', vim.lsp.buf.type_definition, 'Type [D]efinition')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ options = { tabSize = vim.o.tabstop } })
  end, { desc = 'Format current buffer with LSP' })
end

lspz.on_attach(on_attach)
lspz.setup()
local dart_lsp = lspz.build_options('dartls', {})
require('flutter-tools').setup({
  lsp = {
    capabilities = dart_lsp.capabilities
  }
})

local copilot_running = true
local function copilot_toggle()
  if copilot_running then
    copilot_running = false
    vim.cmd("Copilot disable")
  else
    vim.cmd("Copilot enable")
    copilot_running = true
  end
end
vim.keymap.set('n', '<leader>lc', copilot_toggle, { desc = '[C]opilot toggle' })

vim.g.zig_fmt_autosave = 0 -- it is what it is
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
