local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    require 'none-ls.code_actions.eslint_d',
    require 'none-ls.diagnostics.eslint_d',
    null_ls.builtins.formatting.prettierd.with {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'jsonc',
        'yaml',
        'markdown',
        'markdown.mdx',
        'graphql',
        'handlebars',
        'svelte',
      },
    },

    null_ls.builtins.formatting.black,
    require 'none-ls.diagnostics.flake8',
    require 'none-ls.diagnostics.ruff',

    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.code_actions.gomodifytags,

    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.csharpier.with {
      command = 'csharpier',
      args = { 'format', '--write-stdout' },
    },

    null_ls.builtins.diagnostics.stylelint,

    null_ls.builtins.code_actions.refactoring,
  },
  on_attach = function(client, bufnr)
    if client:supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format {
            async = false,
            filter = function(client)
              return client.name == 'null-ls'
            end,
          }
        end,
      })
    end
  end,
}

return opts
