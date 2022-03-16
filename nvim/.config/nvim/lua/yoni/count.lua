local M = {}

local write_count = 0

M.on_write = function()
    write_count = write_count + 1
end


M.main = function()
    print(write_count)
end

return M
