-- Yes yes, I know this is shit, but for now it works baby
vim.cmd([[
set path+=**

set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/_dist/*
set termguicolors

set laststatus=3

set nu
set relativenumber

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set undofile
set undodir=~/.vim/undodir

set exrc
set guicursor=
"set guicursor=i:ver50-iCursor
set noerrorbells

set incsearch
set nohlsearch

set noswapfile
set nobackup

set scrolloff=8
set nowrap

set colorcolumn=80
" set no show mode
set isfname+=@-@
"set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer update time (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes
]])
