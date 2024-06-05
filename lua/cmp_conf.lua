local cmp = require 'cmp'
local snip = require 'luasnip'
snip.setup()

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
    Keyword     = " ",
    Snippet     = " ",
  },
})

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup {

  window = {
    completion = {
      side_padding = 0,
      max_height = 15,
      winhighlight = "Normal:CmpPmenu",
      border = border 'CmpPmenu',
      scrollbar = false,
    },

    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    }
  },

  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
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

    ['='] = cmp.mapping( function (fallback)
      if require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, {'i', 's'}),

    ['+'] = cmp.mapping( function (fallback)
      if require('luasnip').expand_or_jumpable(-1) then
        require('luasnip').expand_or_jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-e>'] = cmp.mapping(function(fallback)
      local success, _ = pcall(vim.lsp.buf.signature_help)
      if not success then fallback() end
    end, { 'i', 's' }),

  },

  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      maxhieght = 25,
    })
  },

  experimental = { ghost_text = true },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    -- add another
    {}
  },
}
