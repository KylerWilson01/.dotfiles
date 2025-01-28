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
    require('mini.pick').setup()
    require('mini.extra').setup()
    require('mini.indentscope').setup()

    local hipatterns = require 'mini.hipatterns'
    local hi_words = require('mini.extra').gen_highlighter.words
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
  end,
}
