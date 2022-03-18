local M = {}

local write_count = 0

M.get_file_name = function()
    local name = vim.api.nvim_buf_get_name(0)

    if not name or name == "" then
        return "(no name)"
    end

    local path = vim.fn.fnamemodify(name, ":p")
    local new_name = vim.fn.fnamemodify(path, ":t")

    return new_name
end

M.get_git_branch = function()
    git_branch = vim.fn["fugitive#head"]()

    if not git_branch or git_branch == "" then
        git_branch = "(no git)"
    end

    git_branch = " " .. git_branch

    return git_branch
end

M.get_line_info = function()
    local line = vim.fn.line(".")
    local offset = vim.fn.col(".")

    return string.format("%d:%d", line, offset)
end

M.get_mode = function()
    -- Get the current mode
    local mode = vim.fn.mode()

    -- I feel sick with this
    if mode == "n" then
        mode = "NORMAL"
    elseif mode == "i" then
        mode = "INSERT"
    elseif mode == "v" then
        mode = "VISUAL"
    elseif mode == "s" then
        mode = "SELECT"
    elseif mode == "S" then
        mode = "SELECT"
    elseif mode == "R" then
        mode = "REPLACE"
    elseif mode == "Rv" then
        mode = "REPLACE"
    elseif mode == "c" then
        mode = "COMMAND"
    elseif mode == "cv" then
        mode = "COMMAND"
    elseif mode == "t" then
        mode = "TERMINAL"
    elseif mode == "V" then
        mode = "VISUAL"
    elseif mode == "g" then
        mode = "GOTO"
    elseif mode == "r" then
        mode = "REPLACE"
    end

    return mode
end

M.get_filetype = function()
  local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
  local filetype = vim.bo.filetype

  if filetype == '' then return '' end
  return string.format(' %s %s ', icon, filetype):lower()
end

M.on_write = function()
    write_count = write_count + 1
end

M.get_write_count = function()
    return write_count
end

local statusline = "%%-4.4(%d%%)%%-15.23(%s%%)|%%-14.14(%s%%)%%-20.20(%s%%)%%-6.6(%s%%)%%-30.70(%s%%)"
function StatusLine()
    return string.format(statusline,
    M.get_mode(),
    M.get_write_count(),
    M.get_file_name(),
    M.get_filetype(),
    M.get_git_branch(),
    status_line)
end

vim.o.statusline = '%!v:lua.StatusLine()'

vim.api.nvim_exec([[
augroup YONI_STATUSLINE
    autocmd!
    autocmd BufWritePre * :lua require("yoni.statusline").on_write()
augroup END
 ]], false)

return M
