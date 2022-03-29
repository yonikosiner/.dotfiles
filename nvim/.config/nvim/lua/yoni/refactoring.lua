local normal = require("yoni.keymaps").normal
local visual = require("yoni.keymaps").visual

visual("<silent> <leader>rw", ":lua require('yoni.telescope').refactors()<CR>")

--  Extracts
visual("<silent> <leader>re", ":lua require('refactoring').refactor(106)<CR>")
normal("<silent> <leader>ri", ":lua require('refactoring').refactor(123)<CR>")

normal("<silent> <leader>dh", ":lua print(vim.inspect(require('refactoring').debug.get_path()))<CR>")
normal("<silent> <leader>dg", ":lua require('refactoring').debug.printf({below = false})<CR>")
normal("<silent> <leader>dm", ":lua require('refactoring').debug.printf({below = true})<CR>")
normal("<silent> <leader>df", ":lua require('refactoring').debug.print_var({below = false})<CR>")
normal("<silent> <leader>db", ":lua require('refactoring').debug.print_var({below = true})<CR>")
