nnoremap <C-t> :lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy({}))<CR>
nnoremap <Leader>tf :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <Leader>tb :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<CR>
