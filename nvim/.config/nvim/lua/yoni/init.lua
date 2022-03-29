local Group = require("colorbuddy.group").Group

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

require("rust-tools").setup({})

Group.new("WinSeparator", nil, nil)
