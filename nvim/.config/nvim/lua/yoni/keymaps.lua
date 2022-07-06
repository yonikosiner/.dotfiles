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

M.normal("*", "*zzzv")
M.normal("#", "#zzzv")
M.normal(",", ",zzzv")
M.normal(";", ";zzzv")
M.normal("n", "nzzzv")
M.normal("N", "Nzzzv")

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

-- JSON stuff
M.normal("<left>", ":lua require('jvim').to_parent()<CR>")
M.normal("<right>", ":lua require('jvim').descend()<CR>")
M.normal("<up>", ":lua require('jvim').prev_sibling()<CR>")
M.normal("<down>", ":lua require('jvim').next_sibling()<CR>")

-- Misc
M.normal("<leader>ch", "<cmd>!chmod +x %<CR>")
M.normal("<leader>u", "<cmd>UndotreeToggle<CR>")

M.normal("<leader>y", '"+y')
M.normal("<leader>Y", '"+y$')
M.normal("<leader>d", '"_d')
M.normal("<leader>x", '"_x')
M.visual("<leader>p", '"_dP')
M.visual("<leader>y", '"+y')
M.visual("<leader>Y", '"+Y')

M.normal("<silent>Q", "<Nop>")

M.normal("<leader>r", ":lua require('yoni.utils').reload_module()<CR>")

M.normal("<leader>ee", "oif err != nil {<CR>}<CR><esc>kkI<esc>")

-- Open my current dir in nnn (termianl file manger) with a quick hotkey, this is very handy
M.normal("<leader><C-o>", ":lua require('yoni.utils').open_dir_nnn()<CR>")
M.normal("<leader><C-p>", ":lua require('yoni.utils').pxToRem()<CR>")
M.normal("<leader><C-d>", ":lua require('yoni.utils').currentDate()<CR>")

-- Add tags in go
M.normal("<leader>t", ":GoAddTag<CR>")

-- React sucks with comments
M.normal("<leader>gcc", ":norm ^i{/*<esc>A*/}<esc><CR>")
M.normal("<leader>guc", ":norm ^df*f*D<CR>")

-- M.visual("J", ":m '>+1<CR>gv=gv")
-- M.visual("k", ":m '<-2<CR>gv=gv")

-- Yes, I'm british btw
M.visual("<leader>bow", ":,'<,'>s/bottle of water/bo'o'woh'ooah'a'<CR>")


M.normal("<leader>o", "o<esc>ko")

return M
