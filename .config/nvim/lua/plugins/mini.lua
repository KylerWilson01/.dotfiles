return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- Appearance
    require('mini.icons').setup()
    require('mini.notify').setup()

    -- Text Editing
    require('mini.ai').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.snippets').setup()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()

    -- Workflow
    require('mini.bracketed').setup()
    require('mini.visits').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.indentscope').setup()
    local pick = require 'mini.pick'
    local extra = require 'mini.extra'
    local hipatterns = require 'mini.hipatterns'

    pick.setup()
    extra.setup()

    local hi_words = extra.gen_highlighter.words
    hipatterns.setup {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = hi_words({ 'FIXME', 'FixMe', 'fixme', 'Fixme' }, 'MiniHipatternsFixme'),
        hack = hi_words({ 'HACK', 'hack', 'Hack' }, 'MiniHipatternsHack'),
        todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
        note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }

    vim.keymap.set('n', '<leader>tgf', function()
      pick.builtin.files { tool = 'rg' }
    end, { desc = 'Search [G]it [F]iles' })

    vim.keymap.set('n', '<leader>tst', function()
      extra.pickers.hipatterns { { scope = 'all' } }
    end, { desc = '[S]earch [T]ags' })

    vim.keymap.set('n', '<leader>tsf', function()
      pick.builtin.files {}
    end, { desc = '[S]earch [F]iles' })

    vim.keymap.set('n', '<leader>tsh', function()
      pick.builtin.help {}
    end, { desc = '[S]earch [H]elp' })

    vim.keymap.set('n', '<leader>tsg', function()
      pick.builtin.grep_live { tool = 'rg' }
    end, { desc = '[S]earch by [G]rep' })

    vim.keymap.set('n', '<leader>tsd', function()
      extra.pickers.diagnostic {}
    end, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader><space>', function()
      extra.pickers.explorer {}
    end, { desc = '[ ] Find existing buffers' })
  end,
}
