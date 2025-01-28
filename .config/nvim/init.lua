--[[
  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/

  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {

      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'vimwiki/vimwiki',
    config = function()
      vim.keymap.set('n', '<C-p>', function()
        vim.diagnostic.jump { count = -1, float = true }
      end, { desc = 'Go to previous diagnostic message' })
    end,
  },

  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup {}
    end,
  },
  'nvim-lua/popup.nvim',
  'nvim-treesitter/nvim-treesitter-context',
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    event = 'VeryLazy',
    opts = function()
      return require 'configs.null-ls'
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    config = function()
      require 'configs.null-ls'
      require('mason-null-ls').setup {
        automatic_installation = true,
        ensure_installed = {},
        ignore_methods = {
          hover = false,
          completion = false,
          formatting = false,
          diagnostics = false,
          code_actions = false,
        },
      }
    end,
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      vim.keymap.set('n', '<leader>xx', function()
        require('trouble').toggle()
      end, { desc = 'Trouble Toggle' }),
      vim.keymap.set('n', '<leader>xw', function()
        require('trouble').toggle 'workspace_diagnostics'
      end, { desc = 'Trouble Toggle [W]orkspace Diagnostics' }),
      vim.keymap.set('n', '<leader>xd', function()
        require('trouble').toggle 'document_diagnostics'
      end, { desc = 'Trouble Toggle [D]ocument Diagnostics' }),
      vim.keymap.set('n', '<leader>xq', function()
        require('trouble').toggle 'quickfix'
      end, { desc = 'Trouble Toggle [Q]uickfix' }),
      vim.keymap.set('n', '<leader>xl', function()
        require('trouble').toggle 'loclist'
      end, { desc = 'Trouble Toggle [L]oclist' }),
      vim.keymap.set('n', 'gR', function()
        require('trouble').toggle 'lsp_references'
      end, { desc = 'Trouble Toggle Lsp References' }),
    },
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  'lukas-reineke/lsp-format.nvim',

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  'nvim-treesitter/playground',
  'christoomey/vim-tmux-navigator',
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  { import = 'plugins' },
}, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
