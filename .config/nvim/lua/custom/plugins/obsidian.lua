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
      workspaces = {
        {
          name = 'obsidian_personal_vault',
          path = '~/obsidian_personal_vault',
        },
      },
    }

    local wk = require 'which-key'

    wk.add {
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open note' },
      { '<leader>od', '<cmd>ObsidianDailies -10 0<cr>', desc = 'Daily notes' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste image' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick switch' },
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Search' },
      { '<leader>ot', '<cmd>ObsidianTags<cr>', desc = 'Tags' },
      { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'Links' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Backlinks' },
      { '<leader>om', '<cmd>ObsidianTemplate<cr>', desc = 'Template' },
      { '<leader>on', '<cmd>ObsidianQuickSwitch nav<cr>', desc = 'Nav' },
      { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Rename' },
      { '<leader>oc', '<cmd>ObsidianTOC<cr>', desc = 'Contents (TOC)' },
    }

    wk.add {
      {
        '<leader>oe',
        function()
          local title = vim.fn.input { prompt = 'Enter title (optional): ' }
          vim.cmd('ObsidianExtractNote ' .. title)
        end,
        desc = 'Extract text into new note',
        mode = 'v',
      },
      {
        '<leader>ol',
        function()
          vim.cmd 'ObsidianLink'
        end,
        desc = 'Link text to an existing note',
        mode = 'v',
      },
      {
        '<leader>on',
        function()
          vim.cmd 'ObsidianLinkNew'
        end,
        desc = 'Link text to a new note',
        mode = 'v',
      },
      {
        '<leader>ot',
        function()
          vim.cmd 'ObsidianTags'
        end,
        desc = 'Tags',
        mode = 'v',
      },
    }
  end,
}
