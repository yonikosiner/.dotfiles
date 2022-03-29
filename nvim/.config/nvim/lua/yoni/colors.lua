local Group = require("colorbuddy.group").Group

Group.new("WinSeparator", nil, nil)

vim.g.yoni_colorscheme = 'gruvbox'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

vim.cmd([[
"This is also from thePrimeagens .vimrc
"https://github.com/thePrimeagen/.dotfiles

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has('nvim')
    call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:yoni_colorscheme])
else
    exe 'colorscheme' g:yoni_colorscheme
endif

    highlight ColorColumn ctermbg=0 guibg=#555555
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    " highlight LineNr guifg=#5eacd3
    highlight LineNr guifg=#aaaaff
    " highlight netrwDir guifg=#5eacd3
    highlight netrwDir guifg=#aaaaff
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd
]])
