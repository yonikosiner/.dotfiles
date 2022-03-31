local normal = require("yoni.keymaps").normal

require("todo-me-daddy").setup{
    get_markdown_todo = true,
    ignore_folders = {
        node_modules = "node_modules",
    }
}

normal("<leader>m", "<cmd>lua require('todo-me-daddy').complete_markdown_todo()<CR>")
normal("<leader>td", ":lua require('telescope').extensions.todo_me_daddy.todos()<CR>")
