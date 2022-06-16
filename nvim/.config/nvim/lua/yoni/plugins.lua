return require('packer').startup(function(use)
    -- Packer can manage itself
    --
    use 'wbthomason/packer.nvim'

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Lsp
    use 'ray-x/lsp_signature.nvim'
    use 'j-hui/fidget.nvim'

    use 'norcalli/nvim-colorizer.lua'
    use 'tjdevries/gruvbuddy.nvim'
    use 'tomasiser/vim-code-dark'
    use 'ray-x/go.nvim'
    use 'ThePrimeagen/jvim.nvim'
    use 'ellisonleao/glow.nvim'
    use 'sbdchd/neoformat'
    use 'tjdevries/colorbuddy.nvim'
    use 'onsails/lspkind-nvim'
    use 'projekt0n/github-nvim-theme'
    -- use 'romgrk/nvim-treesitter-context'
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'rust-lang/rust.vim'
    use 'simrat39/rust-tools.nvim'
    use 'ThePrimeagen/refactoring.nvim'
    use 'mfussenegger/nvim-Dap'
    use 'mfussenegger/nvim-jdtls'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/playground'
    use 'tpope/vim-fugitive'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'simrat39/symbols-outline.nvim'
    use 'numToStr/Comment.nvim'
    use 'gruvbox-community/gruvbox'
    use 'ayu-theme/ayu-vim'
    use 'dunstontc/vim-vscode-theme'
    use 'w0ng/vim-hybrid'
    use 'chriskempson/base16-vim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'mhinz/vim-rfc'
    use 'mbbill/undotree'
    use 'ThePrimeagen/harpoon'
    use 'rafamadriz/friendly-snippets'

    use {
        'folke/tokyonight.nvim', branch = 'main'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }

    use {
        'tzachar/cmp-tabnine',
        run = './install.sh'
    }
end)
