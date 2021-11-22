--local Worktree = require("git-worktree")

--local function is_yonikosiner(path)
    --local found = path:find(vim.env["YONIKOSINER"])
    --return type(found) == "number" and found > 0
--end

--local M = {}
--function M.execute(path, just_build
    ---- TODO: get it to work
    --if is_yonikosiner(path) then
        --local command = string.format(":silent !tmux-yonikosiner-com tmux %s %s", path, just_build)
        --vim.cmd(command)
    --end
--end

--Worktree.on_tree_change(function(_ [>op]], path, _ --[[upstream<])
    --M.execute(path.path)
--end)

--return M
