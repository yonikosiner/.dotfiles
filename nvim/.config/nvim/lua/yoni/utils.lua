local Job = require("plenary.job")

local M = {}

local function reload(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )

    require("telescope.actions").close(prompt_bufnr)

    if content.value == "todo_me_daddy" then
        content.value = "todo-me-daddy"
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
        "kitty",
        "-e",
        "nnn",
        currentDir
    }):start()
end

return M
