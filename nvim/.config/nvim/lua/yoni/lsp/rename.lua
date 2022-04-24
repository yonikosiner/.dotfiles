M = {}

M.rename = function()
    local orginal_pos = vim.api.nvim_win_get_cursor(0)

    local input_buf = vim.api.nvim_create_buf(false, true)

    -- Move the cursor to the start of the variable to rename.
    -- Just to align the window with the start of the word.
    vim.cmd("normal wb")

    local win = vim.api.nvim_open_win(input_buf, true, {
        relative = "cursor",
        style = "minimal",
        row = 1,
        col = 0,
        width = 16,
        height = 1,
        -- border = "single",
    })

    -- Put the user into insert mode inside the window
    vim.cmd("startinsert")

    local clear_mappings = function(bufnr)
        vim.api.nvim_buf_del_keymap(bufnr, "i", "<CR>")
        vim.api.nvim_buf_del_keymap(bufnr, "i", "<ESC>")
        vim.cmd("stopinsert!")
    end

    -- Attach callback to rename the variable on Enter.
    vim.api.nvim_buf_set_keymap(input_buf, "i", "<CR>", "", {
        callback = function()
            local entry = vim.api.nvim_buf_get_lines(0, 0, -1, false)[1]
            clear_mappings(input_buf)
            vim.api.nvim_win_close(win, true)
            if #entry > 0 then
                orginal_pos[2] = orginal_pos[2] + 1
                vim.api.nvim_win_set_cursor(0, orginal_pos)
                vim.lsp.buf.rename(entry)
            end
        end,
    })

    -- Attach callback to clear mappings and close window.
    vim.api.nvim_buf_set_keymap(input_buf, "i", "<ESC>", "", {
        callback = function()
            vim.schedule(function()
                clear_mappings(input_buf)
                vim.api.nvim_win_close(win, true)
                orginal_pos[2] = orginal_pos[2] + 1
                vim.api.nvim_win_set_cursor(0, orginal_pos)
            end)
        end,
    })
end

return M
