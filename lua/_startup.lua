
local function is_git_repo(dir)
    local git_dir = dir .. '/.git'
    return vim.fn.isdirectory(git_dir) == 1
end

local function startup()
    local cwd = vim.fn.getcwd()

    if is_git_repo(cwd) then
        local tree_api = require('nvim-tree.api')
        tree_api.tree.toggle()
    else -- then open a startup window to show all other git repos
        -- TODO: seems like it should not be empty here
    end
end

startup()
