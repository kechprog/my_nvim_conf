local M = {}

function M.setup(lspz)
  local dart_lsp = lspz.build_options('dartls', {})

  require('flutter-tools').setup({
    lsp = {
      capabilities = dart_lsp.capabilities
    }
  })
end

return M
