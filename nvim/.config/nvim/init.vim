set path+=**

set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/pluged')
Plug 'tjdevries/colorbuddy.nvim'

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

let &runtimepath.=',' . expand("$HOME") . '/personal/twitch-bot/ui'
let &runtimepath.=',' . expand("$HOME") . '/personal/todo-me-daddy/clean-me-daddy'
let &runtimepath.=',' . expand("$HOME") . '/personal/harpoon'

" let g:NERDTreeShowHidden=1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

lua require("yoni")

let mapleader = " "

"Toggle spelling on and off with one keybind
fun! SetSpell()
    if &spell
        :set nospell
    else
        :set spell
    endif
endfun

nnoremap <leader>sp :call SetSpell()<CR>

" Have some sex on the side gurllll
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

noremap <leader>rp :resize 100<CR>

"Switch between tabs

"nnoremap <Right> :BufferLineCycleNext<CR>
"nnoremap <Left> :BufferLineCyclePrev<CR>

" lua << EOF
    " require("bufferline").setup{}
" EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 25})
augroup END

augroup YONI
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
