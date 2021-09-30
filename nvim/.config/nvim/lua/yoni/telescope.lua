local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
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
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
      arecibo = {
        ["selected_engine"]   = 'google',
        ["url_open_command"]  = 'xdg-open',
        ["show_http_headers"] = false,
        ["show_domain_icons"] = false,
      },
   },

   pickers = {
       find_files = {
           layout_config = {
               width = 0.9,
               height = 0.9,

               horizontal = {
                   width = { padding = 0.100 },
               },
               vertical = {
                   preview_height = 0.75,
               },
           },
       }
   },

}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
--require('telescope').load_extension("arecibo")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< .dotfiles >",
        cwd = "/home/yoni/.dotfiles",
        hidden = true,
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

return M
