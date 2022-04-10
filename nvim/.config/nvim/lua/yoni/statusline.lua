-- local Color, colors, Group, groups, styles = require('colorbuddy').setup()
local home = os.getenv("HOME")

local M = {}

local write_count = 0
local git_branch = "git"
local msg = nil

M.get_file_name = function()
    local name = vim.api.nvim_buf_get_name(0)

    if not name or name == "" then
        return "(no name)"
    end

    local stringToRegex = "^" .. home .."/"

    local new_name = name:gsub(stringToRegex, "~/")

    return new_name
end

M.get_git_branch = function()
    git_branch = vim.fn["fugitive#head"]()

    if not git_branch or git_branch == "" then
        git_branch = "(no git)"
        return git_branch
    end

    git_branch = "λ " .. git_branch

    return git_branch
end

M.get_line_info = function()
    local line = vim.fn.line(".")
    local offset = vim.fn.col(".")

    return string.format("%d:%d", line, offset)
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
        vim.cmd([[hi StatusLine ctermbg=24 ctermfg=254 guibg=#373b40 guifg=#9fc1ba]])
    else
        vim.cmd([[hi StatusLine ctermbg=24 ctermfg=254 guibg=#373b40 guifg=#7fa3c0]])
    end

    return mode
end

M.get_filetype = function()
  local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
  local filetype = vim.bo.filetype

  if filetype == '' then return "(no filetype)" end
  return string.format(" %s %s ", icon, filetype):lower()
end

M.on_write = function()
    write_count = write_count + 1
end

-- local statusline = %#Normal# .. "%s%%" .. %#Ignore# .. "| %s%%) | %%-5.1000(%s%%) | %%-1.10(%d%%) |%%-5.20(%s%%)%%-6.6 | %s%%) | %s%%)"
local statusline = "%s%% | %s%%) | %%-5.1000(%s%%) | %%-1.10(%d%%) |%%-5.20(%s%%)%%-6.6 | %s%%) | %s%%)"

-- if msg or not msg == "" then
--     statusline = statusline .. "| %s%%)"
-- end

M.StatusLine = function()
    return string.format(statusline,
        M.get_mode(),
        M.get_git_branch(),
        M.get_file_name(),
        write_count,
        M.get_filetype(),
        M.get_line_info(),
        msg)
end

vim.o.statusline = '%!v:lua.require("yoni.statusline").StatusLine()'


local group = vim.api.nvim_create_augroup("YONI_STATUSLINE", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
    require("yoni.statusline").on_write()
end, group = group})

 M.set_status = function(line)
     msg = line
 end

 --TODO: play around with getting colors on the status bar

return M
