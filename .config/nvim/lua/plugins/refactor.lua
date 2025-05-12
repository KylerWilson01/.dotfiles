return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  opts = {},
  keys = {
    {
      '<leader>re',
      function()
        return require('refactoring').refactor 'Extract Function'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Extract Function',
    },
    {
      '<leader>rf',
      function()
        return require('refactoring').refactor 'Extract Function To File'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Extract Function to File',
    },
    {
      '<leader>rv',
      function()
        return require('refactoring').refactor 'Extract Variable'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Extract Variable',
    },
    {
      '<leader>rI',
      function()
        return require('refactoring').refactor 'Inline Function'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Inline function',
    },
    {
      '<leader>ri',
      function()
        return require('refactoring').refactor 'Inline Variable'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Inline variable',
    },

    {
      '<leader>rbb',
      function()
        return require('refactoring').refactor 'Extract Block'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Extract Block',
    },
    {
      '<leader>rbf',
      function()
        return require('refactoring').refactor 'Extract Block To File'
      end,
      expr = true,
      mode = { 'n', 'x' },
      desc = 'Extract block to file',
    },
  },
}
