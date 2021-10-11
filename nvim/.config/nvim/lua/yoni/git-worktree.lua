local Worktree = require("git-worktree")

local function is_yonikosiner_com(path)
    local found = path:find(vim.env["YONIKOSINER"])
    return type(found) == "number" and found > 0
end

local M = {}
function M.execute(path, run_frontend)
    if is_yonikosiner_com(path) then
        local command = string.format(":silent !tmux-yonikosiner-com tmux %s %s", path, run_frontend)
        vim.cmd(command)
    end
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
    M.execute(path.path)
end)
