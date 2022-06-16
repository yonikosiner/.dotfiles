local M = {}

local msg = ""

M.set_status = function(line)
    msg = line
end

local winbar = "%s%s%s%s"

M.Winbar = function()
    return string.format(winbar,
        msg,
        "%=",
        "%m ",
        "%f")
end

vim.opt.winbar = '%!v:lua.require("yoni.winbar").Winbar()'

return M
