local Job = require("plenary.job")

local M = {}

-- Function that intergates with telescope to quickly reload a module
local function reload(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )

    require("telescope.actions").close(prompt_bufnr)

    if content.value == "todo_me_daddy" then
        content.value = "todo-me-daddy"
    elseif content.value == "color-scheme" then
        require("yoni.colors").SetColorScheme()
    end

    require('plenary.reload').reload_module(content.value)
end

function M.reload_module()
    require("telescope.pickers").new({}, {
        prompt_title = "Reload",
        finder = require("telescope.finders").new_table({
            results = {
                "todo_me_daddy",
                "harpoon",
                "yoni.statusline",
                "color-scheme",
            }
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", reload)
            map("n", "<CR>", reload)
            return true
        end,
    }):find()
end

function M.toggleSpell()
    -- If spelling is set to on, then set it to off (or the other way around)
    if vim.o.spell == true then
        vim.o.spell = false
    else
        vim.o.spell = true
    end
end

-- Open my current dir in nnn (termianl file manger) with a quick hotkey
function M.open_dir_nnn()
    local currentDir = vim.cmd("pwd")
    Job:new({
        "alacritty",
        "-e",
        "nnn",
        currentDir
    }):start()
end

--[[ function M.sourceConfig()
end ]]

-- Convert px to rem (dvide higlighted number by 16)
function M.pxToRem()
    vim.cmd("noau normal! 'vy'")
    local px = tonumber(vim.fn.getreg('v'))

    local rem = px / 16

    local stringToSearch = "/%s<CR>"
    stringToSearch = stringToSearch.format(px)

    vim.cmd(stringToSearch)
    vim.cmd("norm! dwi" .. rem)
end

--[[ P = function(v)
    print(vim.inspect(v))
    return v
end ]]

return M
