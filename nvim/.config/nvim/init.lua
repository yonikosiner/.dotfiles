vim.g.mapleader = " "

-- Local vim porjects
vim.opt.rtp:append(vim.fn.expand "~/personal/todo-me-daddy/master")
vim.opt.rtp:append(vim.fn.expand "~/personal/twitch-bot/ui")
vim.opt.rtp:append(vim.fn.expand "~/personal/harpoon/master")

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

require('go').setup()
