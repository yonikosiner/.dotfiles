local M = {}

M.reload_module = function()
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

function M.toggleSpell()
    local spell = vim.o.spell

    if spell == true then
        vim.opt.spell = false
    elseif spell == false then
        vim.opt.spell = true
    end
end

return M
