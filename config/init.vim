" vim-plug
call plug#begin("~/AppData/Local/nvim-data/plugged")

" colorscheme
Plug 'EdenEast/nightfox.nvim'

" syntax
Plug 'windwp/nvim-autopairs'

" other visuals
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'j-hui/fidget.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : 'TSUpdate' }

" tree & tabs
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua'

" telescope
Plug 'nvim-telescope/telescope.nvim'

" lsp
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" rust
Plug 'simrat39/rust-tools.nvim'

call plug#end()
