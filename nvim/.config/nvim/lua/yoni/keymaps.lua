local M = {}

function M.bind(mode, keys, func)
  vim.api.nvim_set_keymap(mode, keys, func, { noremap = true, silent = true })
end

function M.normal(key, func)
  M.bind("n", key, func)
end

function M.visual(key, func)
  M.bind("v", key, func)
end

function M.insert(key, func)
  M.bind("i", key, func)
end

-- Sweet tmux things
M.normal("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Sweet resizes baby
M.normal("<leader>+", "<cmd>vertical resize +5<CR>")
M.normal("<leader>-", "<cmd>vertical resize -5<CR>")
M.normal("<leader>t+", "<cmd>top resize +5<CR>")
M.normal("<leader>t-", "<cmd>top resize -5<CR>")

-- Remaps to move around
M.normal("<C-j>", ":cnext<CR>")
M.normal("<C-k>", ":cprev<CR>")
M.normal("<leader>j", ":lnext<CR>")
M.normal("<leader>k", ":lprevious<CR>")
M.normal("<leader>po", ":copen")
M.normal("<leader>lo", ":lopen<CR>")

M.normal("Y", "y$")
M.normal("n", "nzzzv")
M.normal("N", "nzzzv")
M.normal("J", "mzJ`z")

M.normal("*", "*zzzv")
M.normal("#", "#zzzv")
M.normal(",", ",zzzv")
M.normal(";", ";zzzv")

M.normal("<leader>o", "o<Esc>^Da")
M.normal("<leader>O", "O<Esc>^Da")

-- Move tabs with control+tab and control+shift+tab, like a true soy dev
M.normal("<Tab>", "gt")
M.normal("<S-Tab>", "gT")

-- Use control-c instead of esc, please don't fire me
M.normal("<C-c>", "<Esc>")

-- Sweet remaps to tab stuff gurlll
M.visual("<", "<gv")
M.visual(">", ">gv")

-- File stuff
M.normal("<leader>pv", ":Ex<cr>")
-- Have some sex on the side baby
M.normal("<leader>ft", "<cmd>Sex!<CR>")

-- Connect to that twitch bot gurlll
M.normal("<leader>ea", "[[ <cmd>lua require('twitch-bot').init()<CR> ]]")
M.normal("<leader>ed", "[[ <cmd>lua require('twitch-bot').disconnect()<CR> ]]")

-- Misc
M.normal("<leader>ch", "<cmd>!chmod +x %<CR>")
M.normal("<leader>u", "<cmd>UndotreeToggle<CR>")

M.normal("<leader>y", '"+y')
M.normal("<leader>d", '"_d')
M.normal("<leader>x", '"_x')
M.visual("<leader>p", '"_dP')
M.visual("<leader>y", '"+y')
M.normal("<silent>Q","<Nop>")

M.normal("<leader>m", "<cmd>lua require('todo-me-daddy').complete_markdown_todo()<CR>")

-- Git stuff
M.normal("<leader>ga", ":Git fetch --all<CR>")
M.normal("<leader>grum", ":Git rebase upstream/master<CR>")
M.normal("<leader>grom", ":Git rebase origin/master<CR>")
M.normal("nmap <leader>gh", ":diffget //3<CR>")
M.normal("<leader>gu", ":diffget //2<CR>")
M.normal("<leader>gs", ":G<CR>")

-- Harpoon it gurlll
M.normal("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")

M.normal("<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

M.normal("<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>")
M.normal("<C-t>", ":lua require('harpoon.ui').nav_file(2)<CR>")
M.normal("<C-n>", ":lua require('harpoon.ui').nav_file(3)<CR>")
M.normal("<C-s>", ":lua require('harpoon.ui').nav_file(4)<CR>")
M.normal("<leader><C-h>", ":lua require('harpoon.ui').nav_file(5)<CR>")
M.normal("<leader><C-t>", ":lua require('harpoon.ui').nav_file(6)<CR>")
M.normal("<leader><C-n>", ":lua require('harpoon.ui').nav_file(7)<CR>")
M.normal("<leader><C-s>", ":lua require('harpoon.ui').nav_file(8)<CR>")

M.normal("<silent><leader>tc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

M.normal("<leader><C-r>", ":lua require('harpoon.mark').shorten_list()<CR>")
M.normal("<leader><C-d>", ":lua require('harpoon.mark').clear_all()<CR>")
M.normal("<leader>r", ":lua require('harpoon.mark').promote()<CR>")

M.normal("<leader>tu", ":lua require('harpoon.tmux').gotoTerminal(1)<CR>")
M.normal("<leader>te", ":lua require('harpoon.tmux').gotoTerminal(2)<CR>")
M.normal("<leader>ce", ":lua require('harpoon.tmux').sendCommand(1, 2)<CR>")

-- Spelling
M.normal("<leader>sp", ":lua require('yoni.utils').toggleSpell()<CR>")
return M
