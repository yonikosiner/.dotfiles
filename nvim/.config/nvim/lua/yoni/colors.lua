local Group = require("colorbuddy.group").Group

require("colorizer").setup()
require("colorbuddy").setup()

-- Remove window border color thing - does not work 100% on gruvbox btw
Group.new("WinSeparator", nil, nil)

vim.g.yoni_colorscheme = 'gruvbuddy'

-- Make that gruvbox look good gurllllllllll
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.g.gruvbox_italic = 1

vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = true

vim.g.codedark_italics = 1

-- TOOD: Don't turn on colorbuddy while on telescope window
local M = {}

function M.colorMeDaddy()
    vim.cmd([[
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        highlight ColorColumn ctermbg=0 guibg=#555555
        highlight SignColumn guibg=none
        highlight Normal guibg=none
        highlight LineNr guifg=#aaaaff guibg=None
        highlight netrwDir guifg=#aaaaff
        highlight qfFileName guifg=#aed75f
        highlight TelescopeBorder guifg=#5eacd
        highlight CursorLineNR guibg=None

        highlight StatusLine ctermbg=24 ctermfg=254 guibg=#373b40 guifg=#7fa3c0
        highlight TelescopePromptPrefix guifg=#96f1ff
        highlight Ignore guifg=#373b40 guibg=#7fa3c0

        " highlight netrwDir guifg=#5eacd3
        " highlight LineNr guifg=#5eacd3
    ]])
end

M.SetColorScheme = function()
    -- Set the colorscheme to whatever the global var yoni_colorscheme is equal to
    -- if vim.g.yoni_colorscheme == 'gruvbuddy' then
    require('colorbuddy').colorscheme(vim.g.yoni_colorscheme)
    -- else
    -- vim.cmd("colorscheme " .. vim.g.yoni_colorscheme)
    -- end
    M.colorMeDaddy()
end

M.SetColorScheme()

vim.cmd([[
aug COLORSCHEME
  au!
  au ColorScheme * lua require("yoni.colors").SetColorScheme()
aug END
]])

return M
