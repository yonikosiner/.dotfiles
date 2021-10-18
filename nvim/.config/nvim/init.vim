set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/pluged')
"vim in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/plenary.nvim'

"Plug 'nvim-telescope/telescope-arecibo.nvim', { rocks = {'openssl', 'lua-http-parser'} }

"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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
Plug 'mattn/emmet-vim'
Plug 'simrat39/symbols-outline.nvim'

"Plug 'hrsh7th/nvim-compe'
"Plug 'nvim-lua/completion-nvim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'dense-analysis/ale'
"Plug 'scrooloose/nerdcommenter'

"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'

"fuzy finder"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'mhinz/vim-rfc'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon'
call plug#end()

let g:user_emmet_settings = {
  \  'svelte' : {
  \    'extends' : 'html',
  \  },
  \}

lua require("yoni")

let mapleader = " "

"This is defiantly not copied from thePrimeagens vimrc
"https://github.com/thePrimeagen/.dotfiles
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

nnoremap <silent> <leader> bk :silent !setxkbmap -layout real-prog-dvorak<CR>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>x :!chmod +x %<CR>

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

nnoremap <leader>rrd :call ReadingDocs()<CR>

"Toggle spelling on and off with one keybind
fun! SetSpell()
    "Check if spell is on
    if &spell
        "If spell in on then set spell off
        :set nospell
    else
        "If spell is off then set spell on
        :set spell
    endif
endfun

nnoremap <leader>sp :call SetSpell()<CR>

vmap <C-\> <plug>NERDCommenterToggle
nmap <C-\> <plug>NERDCommenterToggle

nnoremap <leader>fl :Ex<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>ft :Sex!<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

noremap <leader>rp :resize 100<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>


noremap <Leader>t+ :top resize +5<CR>
nnoremap <Leader>t- :top resize -5<CR>

"Coppy selcetd line to clipboard on mac os
vmap <leader>vc :w !pbcopy<CR>

"Coppy file on mac os
nnoremap <leader>pc :%w !pbcopy<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Greatest remap ever
vnoremap <leader>p "_dP

"Next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap <leader>d "_d
noremap <leader>d "_d

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
nnoremap <Right> gt
nnoremap <Left>  gT

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup YONI
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
   autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
