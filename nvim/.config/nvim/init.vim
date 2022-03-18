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
Plug 'github/copilot.vim'
Plug 'projekt0n/github-nvim-theme'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

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

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"Icons
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'

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

"Plug 'hrsh7th/nvim-compe'
"Plug 'nvim-lua/completion-nvim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'dense-analysis/ale'

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

let &runtimepath.=',' . expand("$HOME") . '/personal/Twitch_bot.git/ui'

let g:user_emmet_settings = {
  \  'svelte' : {
  \    'extends' : 'html',
  \  },
  \}
let g:NERDTreeShowHidden=1

lua require("yoni")

let mapleader = " "
nnoremap <leader>ea :lua require("twitch-bot").init()<CR>
nnoremap <leader>ed :lua require("twitch-bot").disconnect()<CR>

"This is defiantly not copied from thePrimeagens vimrc
"https://github.com/thePrimeagen/.dotfiles
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>ch :!chmod +x %<CR>

"For when reading docs turn of numbers
fun! ReadingDocs()
    if &number
        :set norelativenumber
        :set nonumber
    else
        :set relativenumber
        :set number
    endif
endfun

"Toggle spelling on and off with one keybind
fun! SetSpell()
    if &spell
        :set nospell
    else
        :set spell
    endif
endfun

nnoremap <leader>sp :call SetSpell()<CR>

"nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :NERDTreeToggle<CR>
" Have some sex on the side gurllll
nnoremap <leader>ft :Sex!<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

noremap <leader>rp :resize 100<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

noremap <Leader>t+ :top resize +5<CR>
nnoremap <Leader>t- :top resize -5<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap <leader>p "_dP

noremap <leader>y "+y
vnoremap <leader>y "+y

noremap <leader>d "_d
noremap <leader>x "_x

nnoremap Y y$
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJ`z

nnoremap * *zzzv
nnoremap # #zzzv
nnoremap , ,zzzv
nnoremap ; ;zzzv

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>
nnoremap <leader>po :copen<CR>
nnoremap <leader>lo :lopen<CR>

"Stop annoying visual mode
nnoremap <silent>Q <Nop>

" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

noremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"Switch between tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

nnoremap <leader>c :lua require("yoni.count").main()<CR>

"nnoremap <Right> :BufferLineCycleNext<CR>
"nnoremap <Left> :BufferLineCyclePrev<CR>

" lua << EOF
    "require("bufferline").setup{}
" EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 25})
augroup END

augroup YONI
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
    autocmd BufWritePre * :lua require("yoni.count").on_write()
augroup END
