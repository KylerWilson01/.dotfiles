local nvim_lsp = require"lspconfig"

nvim_lsp.tsserver.setup { on_attach=on_attach }

nvim_lsp.clangd.setup { on_attach=on_attach }

nvim_lsp.gopls.setup { 
    cmd = { "gopls" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            diagnostics = {
                disabled = { "unresolved-import" }
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
}
