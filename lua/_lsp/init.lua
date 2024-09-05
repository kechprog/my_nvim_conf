local lspz = require('lsp-zero')
local util = require '_lsp.util'
local on_attach = util.common_on_attach

lspz.extend_lspconfig()
lspz.on_attach(on_attach)
lspz.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})
lspz.setup()

require '_lsp._flutter'.setup(lspz)

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

  ["gopls"] = function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = require '_lsp._go'
    }
  end
}

require('lspconfig').racket_langserver.setup {
  cmd = { "racket", "--lib", "racket-langserver" }, -- Command installed via raco
  capabilities = capabilities,
  on_attach = on_attach,
}
