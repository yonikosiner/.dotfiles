vim.g.mapleader = " "

-- I can't find out how to do this with lua, so yeah it's like this for now
vim.cmd([[
let &runtimepath.=',' . expand("$HOME") . '/personal/todo-me-daddy/master'
let &runtimepath.=',' . expand("$HOME") . '/personal/twitch-bot/ui'
let &runtimepath.=',' . expand("$HOME") . '/personal/harpoon/master'
]])

require("yoni.plugins")
require("yoni.globals")
require("yoni.autocmd")
require("yoni.disable_builtin")
require("yoni.telescope")
require("yoni.lsp")
require("yoni.treesitter")
require("yoni.git-worktree")
require("yoni.statusline")
require("yoni.comment")
require("yoni.utils")
require("yoni.todo-me-daddy")
require("yoni.sets")
require("yoni.colors")
require("yoni.keymaps")
require("yoni.refactoring")
require("yoni.firenvim")
require("yoni.luasnip")
require("yoni.harpoon")
