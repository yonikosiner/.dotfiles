-- Make sure my leader is set befdore anything happens
vim.g.mapleader = " "

-- Local vim porjects
vim.opt.rtp:append(vim.fn.expand "~/personal/todo-me-daddy/fix/duplcite-todo")
vim.opt.rtp:append(vim.fn.expand "~/personal/twitch-bot/ui")
vim.opt.rtp:append(vim.fn.expand "~/personal/harpoon/auto-group")
vim.opt.rtp:append(vim.fn.expand "~/personal/duckytype.nvim")

require("yoni.plugins")

-- vim.notify = require("notify")

require("yoni.globals")
require("yoni.autocmd")
require("yoni.disable_builtin")
require("yoni.telescope")
require("yoni.lsp")
require("yoni.treesitter")
require("yoni.git-worktree")
require("yoni.comment")
require("yoni.utils")
require("yoni.todo-me-daddy")
require("yoni.sets")
require("yoni.colors")
require("yoni.keymaps")
require("yoni.refactoring")
require("yoni.luasnip")
require("yoni.harpoon")
require("yoni.statusline")
require("yoni.winbar")

require('go').setup()

require('duckytype').setup {
    number_of_words = 69,
    average_word_length = 5.69,
}
