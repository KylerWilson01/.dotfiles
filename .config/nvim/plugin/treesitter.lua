-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('treesitter-context').setup {
  max_lines = 5,
  multiline_threshold = 3,
}

-- Diagnostic keymaps
vim.keymap.set('n', '<C-p>', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<C-n>', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
