return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'nvim-neotest/nvim-nio' },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
  },
  opts = {},
  config = function(_, opts)
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      mappings = {},
      expand_lines = true,
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },

      force_buffers = false,
      element_mappings = {
        scopes = {
          edit = 'l',
        },
      },
      layouts = {
        {
          elements = {
            'scopes',
            'breakpoints',
            'stacks',
            'watches',
          },
          size = 80,
          position = 'left',
        },
        {
          elements = { 'repl', 'console' },
          size = 0.25,
          position = 'bottom',
        },
      },
      render = {
        max_value_lines = 3,
        sort_variables = function(a, b)
          return a.name < b.name
        end,
      },
      floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
    }

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open {}
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close {}
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close {}
    end
  end,
}
