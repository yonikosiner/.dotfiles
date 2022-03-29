local actions = require('telescope.actions')
local themes = require('telescope.themes')

function delete_file(file)
    if not file then return end
    if not vim.fn.empty(file) then
        vim.fn.system(string.format('rm %s', file))
    end
end

require('telescope').setup {
    defaults=themes.get_ivy({
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,

        --file_ignoe_patterns = {"dist"}
        --file_ignoe_patterns = {"package-lock.json"}
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    }),
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
   },

   pickers = {
       grep_previewer = {
           theme = "ivy",
       },
       grep_string = {
           theme = "ivy",
       },
       find_files = {
           theme = "ivy",
       },
       file_browser = {
           theme = "ivy",
       },
       git_files = {
           theme = "ivy",
       },

       buffers = {
           sort_mru = true,
           theme = "ivy",
           mappings = {
               i = { ["<c-d>"] = actions.delete_buffer },
           },
       },
       lsp_references = { path_display = { "shorten" } },
       lsp_document_symbols = { path_display = { "hidden" } },
       lsp_workspace_symbols = { path_display = { "shorten" } },
       lsp_code_actions = { theme = "ivy" },
   },
}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
require("telescope").load_extension('harpoon')
require("telescope").load_extension('todo-me-daddy')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< .dotfiles >",
        cwd = "/home/yoni/.dotfiles",
        hidden = true,
    })
end

M.search_school = function()
    require("telescope.builtin").find_files({
        prompt_title = "< school >",
        cwd = "/home/yoni/school-work",
    })
end


M.search_dotfiles_mac = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "/Users/yonikosiner/.dotfiles",
    })
end

local function set_background(content)
    vim.fn.system(
        string.format("change_background %s", content)
    )
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content = require("telescope.actions.state").get_selected_entry(
            prompt_bufnr
        )
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map("i", "<C-s>", function()
        set_the_background(false)
    end)

    map("i", "<CR>", function()
        set_the_background(true)
    end)
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            previewer = false,
            prompt_title = prompt,
            cwd = cwd,

            layout_config  = {
                width = 0.5,
                height = 0.9,
            },

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end,
        })
    end
end

M.anime_selector = image_selector("< Change background> ", "~/.dotfiles/anime")


local function set_pass_clip(content)
    vim.fn.system(
        string.format("pass %s | xclip -in -selection clipboard", content)
    )
end

local function select_pass(prompt_bufnr, map)
    local function set_the_pass(close)
        local content = require("telescope.actions.state").get_selected_entry(
            prompt_bufnr
        )
        set_pass_clip(content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map("i", "<CR>", function()
        set_the_pass(true)
    end)
end

local function pass_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            pickers = {
                find_files = {
                    theme = "dropdown",
                }
            },
            previewer = false,
            prompt_title = prompt,
            cwd = cwd,

            layout_config  = {
                width = 0.5,
                height = 0.5,
            },

            attach_mappings = function(prompt_bufnr, map)
                select_pass(prompt_bufnr, map)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end,
        })
    end
end

M.password_selector = pass_selector("< Select a password >", "~/.dotfiles/password_store")

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )

    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function()
    require("telescope.pickers").new({}, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end,
    }):find()
end

function M.reload_modules()
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

return M
