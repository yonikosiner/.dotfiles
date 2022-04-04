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
M.normal("<leader>po", ":copen<CR>")
M.normal("<leader>lo", ":lopen<CR>")

M.visual("J", "<cmd>m '>+1<CR>gv=gv")
M.visual("K", "<cmd>m '<-2<CR>gv=gv")
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


-- Git stuff
M.normal("<leader>ga", ":Git fetch --all<CR>")
M.normal("<leader>grum", ":Git rebase upstream/master<CR>")
M.normal("<leader>grom", ":Git rebase origin/master<CR>")
M.normal("nmap <leader>gh", ":diffget //3<CR>")
M.normal("<leader>gu", ":diffget //2<CR>")
M.normal("<leader>gs", ":G<CR>")

-- Spelling
M.normal("<leader>sp", ":lua require('yoni.utils').toggleSpell()<CR>")

-- JSON ME DADDY
M.normal("<left>", ":lua require('jvim').to_parent()<CR>")
M.normal("<right>", ":lua require('jvim').descend()<CR>")
M.normal("<up>", ":lua require('jvim').prev_sibling()<CR>")
M.normal("<down>", ":lua require('jvim').next_sibling()<CR>")

-- Misc
M.normal("<leader>ch", "<cmd>!chmod +x %<CR>")
M.normal("<leader>u", "<cmd>UndotreeToggle<CR>")

M.normal("<leader>y", '"+y')
M.normal("<leader>d", '"_d')
M.normal("<leader>x", '"_x')
M.visual("<leader>p", '"_dP')
M.visual("<leader>y", '"+y')

M.normal("<silent>Q","<Nop>")

M.normal("<leader>r", ":lua require('yoni.utils').reload_module()<CR>")

-- Open my current dir in nnn (termianl file manger) with a quick hotkey, this is very handy
M.normal("<leader><C-o>", ":lua require('yoni.utils').open_dir_nnn()<CR>")

return M
