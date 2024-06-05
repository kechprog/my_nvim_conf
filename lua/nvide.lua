if vim.g.neovide then
    local font_size = 18
    local function update_font_size()
        vim.o.guifont = string.format("FiraCode Nerd Font:h%d", font_size)
    end

    vim.keymap.set("n", "<C-+>", function ()
        font_size = font_size + 1
        update_font_size()
    end, {silent=false, desc="Increase font in Neovide"})

    vim.keymap.set("n", "<C-_>", function ()
        font_size = font_size - 1
        update_font_size()
    end, {silent=false, desc="Decrease font in Neovide"})

    update_font_size()
end

