return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require('oil').setup {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        is_always_hidden = function(name, _)
          if name == '.git' or name == 'node_modules' or name == '.vscode' then
            return true
          end
          return false
        end,
      },
    }

    vim.keymap.set('n', '<leader><CR>', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
