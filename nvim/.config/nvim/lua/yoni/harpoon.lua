local normal = require("yoni.keymaps").normal

require("harpoon").setup({
    nav_first_in_list = true,
    projects = {
        --[[ ["/home/yoni/personal/gowiki/"] = {
            term = {
                cmds = {
                    "cd /home/yoni/personal/gowiki/ && go run .",
                }
            }
        } ]]
    }
})

-- Harpoon keybinds
normal("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")

normal("<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

normal("<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>")
normal("<C-t>", ":lua require('harpoon.ui').nav_file(2)<CR>")
normal("<C-n>", ":lua require('harpoon.ui').nav_file(3)<CR>")
normal("<C-s>", ":lua require('harpoon.ui').nav_file(4)<CR>")
normal("<leader><C-h>", ":lua require('harpoon.ui').nav_file(5)<CR>")
normal("<leader><C-t>", ":lua require('harpoon.ui').nav_file(6)<CR>")
normal("<leader><C-n>", ":lua require('harpoon.ui').nav_file(7)<CR>")
normal("<leader><C-s>", ":lua require('harpoon.ui').nav_file(8)<CR>")

normal("<leader><C-d>", ":lua require('harpoon.mark').clear_all()<CR>")

normal("<leader>tu", ":lua require('harpoon.tmux').gotoTerminal(1)<CR>")
normal("<leader>te", ":lua require('harpoon.tmux').gotoTerminal(2)<CR>")
normal("<leader>ce", ":lua require('harpoon.tmux').sendCommand(1, 2)<CR>")
