local normal = require("yoni.keymaps").normal
local visual = require("yoni.keymaps").visual

-- visual("<leader>rw", ":lua require('yoni.telescope').refactors()<CR>")

--  Extracts
-- visual("<leader>re", ":lua require('refactoring').refactor(106)<CR>")
-- normal("<leader>ri", ":lua require('refactoring').refactor(123)<CR>")

normal("<leader>h", ":lua print(vim.inspect(require('refactoring').debug.get_path()))<CR>")
normal("<leader>g", ":lua require('refactoring').debug.printf({below = false})<CR>")
normal("<leader>dm", ":lua require('refactoring').debug.printf({below = true})<CR>")
-- normal("<silent> <leader>df", ":lua require('refactoring').debug.print_var({below = false})<CR>")
-- normal("<silent> <leader>db", ":lua require('refactoring').debug.print_var({below = true})<CR>")
