local normal = require("yoni.keymaps").normal

require("todo-me-daddy").setup {
    your_name = "yoni",
    get_markdown_todo = true,
    ignore_folders = {
        node_modules = "node_modules",
        public = "public",
    }
}

normal("<leader>m", "<cmd>lua require('todo-me-daddy').complete_markdown_todo()<CR>")
normal("<leader>td", ":lua require('telescope').extensions.todo_me_daddy.todos()<CR>")
normal("<leader>tm", ":lua require('telescope').extensions.todo_me_daddy.your_todos()<CR>")
