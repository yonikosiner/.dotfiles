-- local Color, colors, Group, groups, styles = require('colorbuddy').setup()
local home = os.getenv("HOME")

local M = {}

local write_count = 0
local git_branch = "git"
local msg = ""

M.get_file_name = function()
    local name = vim.api.nvim_buf_get_name(0)

    if not name or name == "" then
        return "[No Name]"
    end

    local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
    local icon = require 'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })

    local fileName = vim.fn.pathshorten(vim.fn.fnamemodify(name, ":."))
    fileName = icon .. " " .. fileName

    return fileName
end

local function getGitIcon()
    local ok, icon = pcall(function()
        return require("nvim-web-devicons").get_icon ".gitattributes"
    end)
    return ok and icon or ""
end

M.get_git_branch = function()
    git_branch = vim.fn["fugitive#head"]()

    if not git_branch or git_branch == "" then
        git_branch = " [No Git]"
    else
        git_branch = " %s " .. git_branch
        git_branch = string.format(git_branch, getGitIcon())
    end

    return git_branch
end

M.get_line_info = function()
    local offset = vim.fn.col(".")

    if offset == 1 or offset == 2 or offset == 3 or offset == 4 or offset == 5 or offset == 6 or offset == 7 or offset == 8 or offset == 9 then
        offset = "0" .. offset
    end

    return string.format("%s", offset)
end

M.get_mode = function()
    local mode = vim.fn.mode()

    local mode_table = {
        ["n"] = "Normal",
        ["i"] = "Insert",
        ["v"] = "Visual",
        ["c"] = "Command",
        ["cv"] = "Command",
        ["V"] = "Visual",
    }

    if mode_table[mode] then
        mode = mode_table[mode]
    end

    if mode == "Insert" then
        vim.cmd([[highlight Modes guifg=#F2F2F2]])
    else
        vim.cmd([[highlight Modes guifg=#373b40 guibg=#7fa3c0]])
    end

    return mode
end

M.get_filetype = function()
    local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
    local icon = require 'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
    local filetype = vim.bo.filetype

    if filetype == '' then return "(no filetype)" end
    return string.format(" %s %s ", icon, filetype):lower()
end

M.on_write = function()
    write_count = write_count + 1

    if write_count == 1 or write_count == 2 or write_count == 3 or write_count == 4 or write_count == 5 or write_count == 6 or write_count == 7 or write_count == 8 or write_count == 9 then
        write_count = "0" .. write_count
    end

    if write_count >= 100 then
        write_count = ".."
    end
end

local statusline = "%%#Modes#" .. " %s%%)" .. "%%#Ignore#" .. "%s%% %s%%)  %%-5.100(%s%%) %s%% %%-1.50(%s%%) %%-5.20(%s%%)%%-6.6  %s%%)"

-- if msg or not msg == "" then
--     statusline = statusline .. "| %s%%)"
-- end

M.StatusLine = function()
    return string.format(statusline,
        M.get_mode(),
        M.get_git_branch(),
        -- The %= puts a break in
        "%=",
        M.get_file_name(),
        -- Having the double %= makes sure that the file name is in the middle
        "%=",
        write_count,
        M.get_line_info(),
        msg)
end

vim.o.statusline = '%!v:lua.require("yoni.statusline").StatusLine()'

local group = vim.api.nvim_create_augroup("YONI_STATUSLINE", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
    vim.cmd("silent! lua require('yoni.statusline').on_write()")
end, group = group })

M.set_status = function(line)
    msg = line
end

--TODO: play around with getting colors on the status bar

return M
