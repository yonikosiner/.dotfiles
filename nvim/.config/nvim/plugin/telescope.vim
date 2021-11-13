nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

nnoremap <leader>lps :lua require('telescope.builtin').lsp_references({ layout_config = {width = 0.5, height = 0.5}})<CR>

nnoremap <leader>vrc :lua require('yoni.telescope').search_dotfiles()<CR>
nnoremap <leader>src :lua require('yoni.telescope').search_school()<CR>
nnoremap <leader>vrcm :lua require('yoni.telescope').search_dotfiles_mac()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vih :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>va :lua require('yoni.telescope').anime_selector()<CR>
nnoremap <leader>pa :lua require('yoni.telescope').password_selector()<CR>

nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_commits<CR>

nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees({ layout_config = { width = 0.5, height = 0.5 }})<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree({ layout_config = { width = 0.5, height = 0.5 }})<CR>
