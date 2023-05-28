local function is_git_repo(dir)
    local git_dir = dir .. '/.git'
    return vim.fn.isdirectory(git_dir) == 1
end
local cwd = vim.fn.getcwd()

local function body_content()
    local git_dirs = {}
    local keymap_prefix = "<leader>"
    local counter = 0

    local function recursive_git_check(dir)
        local dirs = vim.fn.glob(dir .. "/*", true, true)

        for _, subdir in ipairs(dirs) do
            if is_git_repo(subdir) then
                counter = counter + 1
                --           |  table  |                name                    |        command        |             keymap               |
                table.insert(git_dirs, { tostring(counter).."|".." " .. subdir, ":cd "..subdir, keymap_prefix .. tostring(counter)})
            end

            -- Recursively check this subdir for more Git repos
            recursive_git_check(subdir)
        end
    end

    table.insert(git_dirs, { " Find File", "Telescope find_files", "<leader>ff" })
    recursive_git_check(cwd)

    return git_dirs
end

local b_content = body_content()
local settings = {
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = function()
            return {
                " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                " " .. cwd,
                -- require("startup.functions").quote()
            }
        end,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = b_content,
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },

    colors = {
        background     = "#1f2227",
        folded_section = "#56b6c2",
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    parts = { "header", "body" },
}

require('startup').setup(settings)
