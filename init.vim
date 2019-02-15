" Must be first line
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'                     " AG for vim
Plug 'tpope/vim-sensible'               " a universal set of defaults
Plug 'tpope/vim-commentary'             " Comment in and out
" Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'               " surround parentheses, brackets, quotes, ...
Plug 'tpope/vim-fugitive'               " Git tool
Plug 'tpope/vim-vinegar'                " Open netrw with -
Plug 'Shougo/deoplete.nvim'             " completion framework
Plug 'Shougo/denite.nvim'               " fuzzy finder
Plug 'Shougo/neoyank.vim'               " Saves yank history
Plug 'bling/vim-airline'                " Status bar
Plug 'w0rp/ale'                         " Linter
Plug 'andymass/vim-matchup'             " highlight matching words
Plug 'ntpeters/vim-better-whitespace'   " highlight trailing whitespace
Plug 'farmergreg/vim-lastplace'         " reopen files at your last edit position
Plug 'rstacruz/vim-closer'              " Closes brackets
Plug 'dracula/vim'                      " Colortheme
Plug 'soft-aesthetic/soft-era-vim'      " Colortheme
Plug 'tpope/vim-markdown'               " Markdown syntax
Plug 'derekwyatt/vim-scala'             " Scala syntax
Plug 'wavded/vim-stylus'                " Stylus syntax
Plug 'rust-lang/rust.vim'               " Rust syntax
Plug 'mustache/vim-mustache-handlebars' " Handlebars syntax
Plug 'leafgarland/typescript-vim'       " Typescriptt syntax
Plug 'udalov/kotlin-vim'                " Kotlin syntax
Plug 'gre/play2vim'                     " Playframework (twirl) syntax
Plug 'elixir-editors/vim-elixir'
Plug 'mattn/webapi-vim'                 " VIM web client
Plug 'dennis84/cll'
Plug 'dennis84/vim-scastie'
call plug#end()

" Sets the mapleader (<leader>) to ,
let mapleader = ","

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme
colorscheme soft-era

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

" Surround mappings
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround

" deoplete
let g:deoplete#enable_at_startup = 1

" Unite
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

nnoremap <leader>p :<C-u>Denite file_rec<cr>
nnoremap <leader>s :<C-u>Denite buffer<cr>
nnoremap <leader>y :<C-u>Denite neoyank<cr>
nnoremap <leader>l :<C-u>Denite line<cr>

call denite#custom#map(
  \ '_',
  \ '<Esc>',
  \ '<denite:enter_mode:normal>',
  \ 'noremap'
  \)

" Cleans the code. Replaces tabs with spaces, fixes the line returns and
" deletes end of line blanks.
function! CleanCode()
  " Replace tabs with spaces
  %retab

  " Turn DOS returns ^M into real returns
  %s/\r/\r/eg

  " Delete end of line blanks
  %s=  *$==e
  echo "Cleaned up this mess."
endfunction

nmap <leader>cc :call CleanCode()<cr>

" set bash shell if fish-shell is active
if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'java': [],
\  'scala': [],
\}
