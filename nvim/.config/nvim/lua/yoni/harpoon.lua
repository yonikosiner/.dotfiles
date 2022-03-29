require("harpoon").setup({
    nav_first_in_list = true,
    projects = {
        ["/home/yoni/personal/gowiki/"] = {
            term = {
                cmds = {
                    "cd /home/yoni/personal/gowiki/ && go run .",
                }
            }
        }
    }
})


