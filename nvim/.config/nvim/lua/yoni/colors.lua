local Group = require("colorbuddy.group").Group

-- Remove windo border color thing - does not work 100% on gruvbox btw
Group.new("WinSeparator", nil, nil)

vim.g.yoni_colorscheme = 'gruvbox'

-- Make that gruvbox look good gurllllllllll
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

-- Set the colorscheme to whatever the gloabl var yoni_colorscheme is equal to
vim.cmd("colorscheme " .. vim.g.yoni_colorscheme)

vim.cmd([[
    highlight ColorColumn ctermbg=0 guibg=#555555
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    highlight LineNr guifg=#aaaaff
    highlight netrwDir guifg=#aaaaff
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd

    " highlight netrwDir guifg=#5eacd3
    " highlight LineNr guifg=#5eacd3
]])
