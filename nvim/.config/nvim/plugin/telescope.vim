nnoremap <C-t> <cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <Leader>tf <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <Leader>tb <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<CR>
