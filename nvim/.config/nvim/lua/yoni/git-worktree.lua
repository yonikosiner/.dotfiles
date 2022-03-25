local Worktree = require("git-worktree")

local function is_todo_me_daddy(path)
    local env = os.getenv("TODO_ME_DADDY")
    print("env: " .. env)
    print("path: " .. path)
    local found = string.find(path, env)
    print("found: " .. tostring(found))
    return type(found) == "number" and found > 0
end

local M = {}
function M.execute(path)
    if is_todo_me_daddy(path) then
        local command = string.format(":!echo '%s' > ~/tmp.txt", path)
        vim.cmd(command)
    end
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
    M.execute(path.path)
end)

return M
