set path+=**
set wildignore+=*_build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin("~/.local/share/nvim/site/autoload")

Plug 'rose-pine/neovim'

" telescope requirements
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua require("philbert/lsp")
lua require("philbert/cmp")
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.jsx,*.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.scss set filetype=scss
    autocmd FileType go autocmd BufWritePre <buffer> silent GoFmt
    autocmd FileType go autocmd BufWritePre <buffer> silent GoImport
augroup END

let mapleader = ' ' 

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <c-d> <c-d>zzzv
nnoremap <c-u> <c-u>zzzv
nnoremap <leader>e :Ex<CR>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
