local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

npairs.remove_rule("'")
npairs.add_rules({
  Rule("'", "'")
    :with_pair(cond.not_filetypes({ "racket" })) -- Disable single quote pairing in .rkt files
})
