local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup{ on_attach=on_attach }

nvim_lsp.clangd.setup { 
    on_attach=on_attach,
    cmd={ "/usr/local//Cellar/llvm/12.0.1/bin/clangd", "--background-index", "--clang-tidy" },
}

