vim.g.mapleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir='rm -rf'

-- I'll put this in lua one day
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 25})
augroup END

augroup YONI
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
]])

require("yoni.plugins")
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
