" Must be first line
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'                  " Ack for vim
Plug 'tpope/vim-sensible'               " a universal set of defaults
Plug 'tpope/vim-commentary'             " Comment in and out
Plug 'tpope/vim-surround'               " surround parentheses, brackets, quotes, ...
Plug 'tpope/vim-fugitive'               " Git tool
Plug 'tpope/vim-vinegar'                " Open netrw with -
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'            " Status bar
Plug 'w0rp/ale'                         " Linter
Plug 'andymass/vim-matchup'             " highlight matching words
Plug 'farmergreg/vim-lastplace'         " reopen files at your last edit position
Plug 'tpope/vim-markdown'               " Markdown syntax
Plug 'derekwyatt/vim-scala'             " Scala syntax
Plug 'rust-lang/rust.vim'               " Rust syntax
Plug 'leafgarland/typescript-vim'       " Typescript syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'udalov/kotlin-vim'                " Kotlin syntax
Plug 'mattn/webapi-vim'                 " VIM web client
Plug 'dennis84/cll'
Plug 'unblevable/quick-scope'
Plug 'ruanyl/vim-gh-line'
Plug 'folke/tokyonight.nvim'
Plug 'zakharykaplan/nvim-retrail'
call plug#end()

" Sets the mapleader (<leader>) to ,
let mapleader = ","

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorscheme
colorscheme tokyonight-night
let g:lightline = {'colorscheme': 'tokyonight'}

highlight Comment cterm=italic

"set background=light
hi Normal ctermbg=none

" Sets a ruler at 80 chars
set colorcolumn=80

" Use spaces then tabs
set expandtab

" Sets smartindent
set smartindent

" Sets tabs to two spaces
set tabstop=2

" Tabstop to 2
set softtabstop=2

" I dont know what that is doing
set shiftwidth=2

" Enables line numbers
set number

 " Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Use an SCM instead of swap files
set noswapfile

" Do not set the terminal's title
set notitle

" No beeping.
set visualbell

" Disable the mouse.
set mouse=

" lines to scroll when cursor leaves screen.
set scrolljump=5

" Case-insensitive searching.
set ignorecase

" But case-sensitive if expression contains a capital letter.
set smartcase

" Highlight matches.
set hlsearch

" Show matching char (like {})
set showmatch

set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.hi,tags
set wildignore+=**/logs/*,**/target/*,**/dist/*,**/node_modules/*

" Allow per-project configuration
set exrc

" Required for operations modifying multiple buffers like rename.
set hidden

" Close other windows
map <leader>wo :only<cr>

" Move in windows
map <leader>ww :wincmd w<cr>
map <leader>wh :wincmd h<cr>
map <leader>wj :wincmd j<cr>
map <leader>wk :wincmd k<cr>
map <leader>wl :wincmd l<cr>

" Delete buffer
nmap <leader>wd :bd<cr>

" Delete buffer and file
nmap <leader>wD :!rm %<cr>:bd!<cr>

" Expand current file dir in console mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Clear search highlight
nmap <silent> <leader>/ :nohl<cr>

noremap H ^
noremap L $

" TAB completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

command! MakeTags !/usr/local/bin/ctags -R .

" Surround mappings
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround

" FZF
nnoremap <silent> <Leader>p :FZF<CR>
nnoremap <silent> <Leader>s :Buffers<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden'

" set bash shell if fish-shell is active
if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'scala': [],
\  'kotlin': [],
\  'java': ['checkstyle'],
\}

let g:ale_java_checkstyle_config = '~/checkstyle.xml'
let g:ale_kotlin_kotlinc_config_file = '~/.editorconfig'

hi! clear SpellBad
hi SpellBad cterm=underline

let g:ackprg = 'ag --vimgrep --smart-case --hidden'

" Remap <cr> to make it confirms completion:
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

lua require("retrail").setup()
