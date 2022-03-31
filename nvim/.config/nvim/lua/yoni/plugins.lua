vim.cmd([[
call plug#begin('~/.vim/pluged')
Plug 'ThePrimeagen/jvim.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'sbdchd/neoformat'

Plug 'tjdevries/colorbuddy.nvim'
Plug 'onsails/lspkind-nvim'

" Plug 'github/copilot.vim'
Plug 'projekt0n/github-nvim-theme'

Plug 'romgrk/nvim-treesitter-context'

Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lua/lsp_extensions.nvim'

Plug 'rust-lang/rust.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'

Plug 'ThePrimeagen/refactoring.nvim'

" Debugger Plugins
Plug 'mfussenegger/nvim-Dap'

"vim in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'mfussenegger/nvim-jdtls'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Make that vim good gurrllll
Plug 'ThePrimeagen/vim-be-good'

Plug 'nvim-lua/plenary.nvim'

"Plug 'nvim-telescope/telescope-arecibo.nvim', { rocks = {'openssl', 'lua-http-parser'} }

" Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
"Git
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/git-worktree.nvim'

"Lsp pulgins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'simrat39/symbols-outline.nvim'

Plug 'numToStr/Comment.nvim'

"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'dunstontc/vim-vscode-theme'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'

"fuzy finder"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'mhinz/vim-rfc'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon'
call plug#end()
]])
