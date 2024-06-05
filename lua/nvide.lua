if vim.g.neovide then
    local font_size = 18
    local function update_font_size()
        vim.o.guifont = string.format("FiraCode Nerd Font:h%d", font_size)
    end

    local function paste_in_terminal()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>\"+pa", true, true, true), "n", true)
        vim.api.nvim_feedkeys("i", "n", true) -- Return to insert mode in terminal
    end


    vim.keymap.set("n", "<C-+>", function()
        font_size = font_size + 1
        update_font_size()
    end, { silent = false, desc = "Increase font in Neovide" })

    vim.keymap.set("n", "<C-_>", function()
        font_size = font_size - 1
        update_font_size()
    end, { silent = false, desc = "Decrease font in Neovide" })

    vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
    vim.keymap.set("t", "<C-v>", paste_in_terminal, { noremap = true, silent = true })

    update_font_size()
end
