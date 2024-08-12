return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
    'epwalsh/pomo.nvim',
  },
  config = function()
    require('obsidian').setup {
      daily_notes = {
        folder = '06 - Daily',
        date_format = '%Y.%m.%d',
        default_tags = { 'Daily' },
        template = '(TEMPLATE) Daily.md',
      },
      templates = {
        folder = '99 - Meta/00 - Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      new_notes_location = 'notes_subdir',
      notes_subdir = '05 - Fleeting',
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        -- Toggle check-boxes.
        ['<leader>ch'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      workspaces = {
        {
          name = 'obsidian_personal_vault',
          path = '~/obsidian_personal_vault',
        },
      },
    }
  end,
}
