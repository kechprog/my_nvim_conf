require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    opleader = {
        line = '<leader>/',
        block = '<leader>?',
    },
        toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/',
        ---Block-comment toggle keymap
        block = '<leader>?',
    },
    mappings = {
        basic = true,
        extra = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
