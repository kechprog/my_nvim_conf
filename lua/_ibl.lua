require "ibl".setup({
    indent = {
        tab_char = {'.'},
        char = {'|'},
        highlight = {"Function", "Label"},
        priority = 2,
    },
    scope = {
        show_start = true,
        show_end = true,
        priority = 3,
    }
})
