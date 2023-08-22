local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.setup {}

require('lspkind').init({
  mode = 'symbol_text',
  preset = 'codicons',
  symbol_map = {
    Text        = "T ",
    Method      = "󰡱 ",
    Function    = "󰊕 ",
    Constructor = " ",
    Field       = " ",
    Variable    = "󰫧 ",
    Class       = "󰜂 ",
    Interface   = " ",
    Module      = " ",
    Property    = " ",
    Enum        = " ",
    File        = " ",
    Reference   = "& ",
    Folder      = " ",
    EnumMember  = " ",
    Constant    = "󰏿 ",
    Struct      = "󰜂 ",
    Operator    = " ",
    Copilot     = " ",
    Keyword     = " ",
    Snippet     = " ",
  },
})

require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
}
require("copilot_cmp").setup()

cmp.setup {

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    
    ['<C-k>'] = cmp.mapping.scroll_docs(4),

    ['<C-Space>'] = cmp.mapping.complete {},

    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

    ['\\'] = cmp.mapping( function (fallback) 
      if require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, {'i', 's'}),

    ['|'] = cmp.mapping( function (fallback)
      if require('luasnip').expand_or_jumpable(-1) then
        require('luasnip').expand_or_jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

  },

  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      maxhieght = 25,
    })
  },

  sorting = {
    comparators = {require('copilot_cmp.comparators').prioritize}
  },

  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    -- add another
    {}
  },
}
