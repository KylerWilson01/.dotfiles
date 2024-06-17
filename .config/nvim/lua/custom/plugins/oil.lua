return {
  'stevearc/oil.nvim',

  opts = function()
    require('oil').setup()
    vim.keymap.set('n', '<leader><CR>', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
