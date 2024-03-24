local function on_attach(client, bufnr)
  local util = require '_lsp.util'
  local golsp = require 'go'
  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

  golsp.setup()
  util.common_on_attach(client, bufnr)

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
     require('go.format').goimports()
    end,
    group = format_sync_grp,
  })


  -- TODO: make a good prompt
  local function impl_complete()
    golsp.impl_complete()
  end

  util.nmap('<leader>lgi', impl_complete, bufnr, "[l]sp [g]enerate [i]mplementation")
  util.nmap('<leader>lgr', require 'go.lsp'.hover_returns, bufnr, "[l]sp [g]enerate [r]eturn")

end

return on_attach
