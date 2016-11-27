" Must be first line
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/denite.nvim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'dennis84/vim-collab'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'w0rp/ale'

call neobundle#end()

" Sets the mapleader (<leader>) to ,
let mapleader = ","

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  colorscheme solarized
endif

set background=dark

" Sets a ruler at 80 chars
set colorcolumn=80

" Use spaces then tabs
set expandtab

" Enables auto indentation
set autoindent

" Sets smartindent
set smartindent

" Sets tabs to two spaces
set tabstop=2

" Tabstop to 2
set softtabstop=2

" I dont know what that is doing
set shiftwidth=2

" Intuitive backspacing.
set backspace=indent,eol,start

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

" Show 7 lines of context around the cursor.
set scrolloff=7
set sidescrolloff=7

" lines to scroll when cursor leaves screen.
set scrolljump=5

" Case-insensitive searching.
set ignorecase

" But case-sensitive if expression contains a capital letter.
set smartcase

" Highlight matches as you type.
set incsearch

" Highlight matches.
set hlsearch

" Show matching char (like {})
set showmatch

" Shows the statusline.
set laststatus=2

" Set utf-8 encoding
set encoding=utf-8

set wildmenu
set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.hi,tags
set wildignore+=**/cache/*,**/logs/*,**/target/*,**/dist/*,**/node_modules/*

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

" Show tig
nmap <silent>ti :!tig status<cr>

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
" TAB completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Unite
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source(
  \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
  \ 'file_rec', 'sorters', ['sorter_sublime'])

nnoremap <leader>p :<C-u>Denite file_rec<cr>
nnoremap <leader>s :<C-u>Denite buffer<cr>
nnoremap <leader>y :<C-u>Denite neoyank<cr>
nnoremap <leader>l :<C-u>Denite line<cr>

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
