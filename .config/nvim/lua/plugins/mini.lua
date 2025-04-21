return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- Appearance
    require('mini.icons').setup()

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
    require('mini.diff').setup()
    local extra = require 'mini.extra'
    local hipatterns = require 'mini.hipatterns'

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
    vim.keymap.set('n', '<leader>tst', function()
      extra.pickers.hipatterns { { scope = 'all' } }
    end, { desc = '[S]earch [T]ags' })
  end,
}
