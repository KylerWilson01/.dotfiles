local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup{ on_attach=on_attach }

nvim_lsp.clangd.setup { on_attach=on_attach }

