local Group = require("colorbuddy.group").Group

-- Remove window border color thing - does not work 100% on gruvbox btw
Group.new("WinSeparator", nil, nil)

vim.g.yoni_colorscheme = 'gruvbox'

-- Make that gruvbox look good gurllllllllll
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.g.gruvbox_italic = 1

-- Set the colorscheme to whatever the global var yoni_colorscheme is equal to
vim.cmd("colorscheme " .. vim.g.yoni_colorscheme)

vim.cmd([[
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    highlight ColorColumn ctermbg=0 guibg=#555555
    hi SignColumn guibg=none
    highlight Normal guibg=none
    highlight LineNr guifg=#aaaaff
    highlight netrwDir guifg=#aaaaff
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd

    " hi CursorLineNR guibg=None
    " highlight netrwDir guifg=#5eacd3
    " highlight LineNr guifg=#5eacd3
]])
