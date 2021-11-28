local Worktree = require("git-worktree")

local function is_yoni(path)
    local found = path:find(vim.env["YONIKOSINER"])
    return type(found) == "number" and found > 0
end

local M = {}
function M.execute(path, just_build)
    if is_yoni(path) then
        local command = string.format(":silent! !tmux-yonikosiner tmux %s run_frontend", path)
        print(command)
        vim.cmd(command)
    end
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
    M.execute(path.path)
end)

return M
