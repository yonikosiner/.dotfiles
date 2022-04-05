-- We create a grop which will be cleared each time
local group = vim.api.nvim_create_augroup("YONI", { clear = true })

-- Give that sweet little yellow thing for a second on a yank, so I know what I
-- have yanked
vim.api.nvim_create_autocmd("TextYankPost", { callback = function()
    require'vim.highlight'.on_yank({ timeout = 25 })
end, group = group})

-- Clear whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
    -- This is scuffed, but lua won't let me use \ to escapee a Character, and
    -- vim does not like it when you use |
    vim.cmd([[:%s/\s\+$//e]])
end, group = group})

-- Go is being really anoying with showing erros messages, unless I restart, so each time I save a go file, just restart it
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     -- pattern = { "go" },
--     callback = function()
--         vim.cmd(":edit")
--     end,
--     group = group
-- })
