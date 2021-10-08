nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>


nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader><C-h> :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader><C-t> :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader><C-n> :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader><C-s> :lua require("harpoon.ui").nav_file(8)<CR>

nnoremap <leader><C-r> :lua require("harpoon.mark").shorten_list()<CR>
nnoremap <leader><C-d> :lua require("harpoon.mark").clear_all()<CR>
nnoremap <leader>r :lua require("harpoon.mark").promote()<CR>

nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
