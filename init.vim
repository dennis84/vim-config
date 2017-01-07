" Must be first line
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-vinegar'
Plug 'derekwyatt/vim-scala'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neoyank.vim'
Plug 'bling/vim-airline'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'dennis84/vim-collab'
Plug 'wavded/vim-stylus'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
call plug#end()

" Sets the mapleader (<leader>) to ,
let mapleader = ","

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme

if filereadable(expand("~/.vim/plugged/vim-colors-solarized/colors/solarized.vim"))
  colorscheme solarized
endif

set background=dark

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

call denite#custom#map(
  \ '_',
  \ '<Tab>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)

call denite#custom#map(
  \ '_',
  \ '<S-Tab>',
  \ '<denite:move_to_previous_line>',
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
