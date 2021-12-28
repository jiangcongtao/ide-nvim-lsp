-- Find files using Telescope command-line sugar.
vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <leader>fg <cmd>Telescope live_grep<cr>")
vim.cmd("nnoremap <leader>fb <cmd>Telescope buffers<cr>")
vim.cmd("nnoremap <leader>fh <cmd>Telescope help_tags<cr>")

-- Using Lua functions
vim.cmd("nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>")
vim.cmd("nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.cmd("nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>")
vim.cmd("nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>")