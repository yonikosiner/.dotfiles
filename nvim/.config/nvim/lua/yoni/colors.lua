local Group = require("colorbuddy.group").Group

require("colorbuddy").setup()

-- Remove window border color thing - does not work 100% on gruvbox btw
Group.new("WinSeparator", nil, nil)

vim.g.yoni_colorscheme = 'gruvbox'

-- Make that gruvbox look good gurllllllllll
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.g.gruvbox_italic = 1

vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = true

vim.g.codedark_italics = 1

-- Set the colorscheme to whatever the global var yoni_colorscheme is equal to
if vim.g.yoni_colorscheme == 'gruvbuddy' then
    require('colorbuddy').colorscheme('gruvbuddy')
else
    vim.cmd("colorscheme " .. vim.g.yoni_colorscheme)
end

-- TOOD: Don't turn on colorbuddy while on telescope window
if vim.api.nvim_buf_get_name(0) == "telescopeprompt" then
    require("colorizer").setup()
end

local function colorMeDaddy()
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
        hi CursorLineNR guibg=None

        hi StatusLine ctermbg=24 ctermfg=254 guibg=#373b40 guifg=#7fa3c0
        highlight TelescopePromptPrefix guifg=#96f1ff

        " highlight netrwDir guifg=#5eacd3
        " highlight LineNr guifg=#5eacd3
    ]])
end

colorMeDaddy()
-- vim.cmd(":match MyGroup /Normal/")
