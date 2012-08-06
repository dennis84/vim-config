"  _______         ___ ___ __           
" |   |   |.--.--.|   |   |__|.--------.
" |       ||  |  ||   |   |  ||        |
" |__|_|__||___  | \_____/|__||__|__|__|
"          |_____|                      
"
" My personal Vim config!

" ==============================================================================
" Initial Stuff
" ==============================================================================

" Must be first line
set nocompatible
filetype off

" Setup vundle bundle manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" ==============================================================================
" Bundles to install and load
" ==============================================================================

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sickill/vim-monokai'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'wojtekmach/vim-rename'
Bundle 'tpope/vim-surround'
Bundle 'derekwyatt/vim-scala'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-fugitive'
Bundle 'slack/vim-bufexplorer'
Bundle 'gre/play2vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'daveray/vimclojure-easy'
Bundle 'nono/vim-handlebars'


" ==============================================================================
" Global Stuff
" ==============================================================================

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme

" Colorsheme
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_menu=0
let g:solarized_italic=0
set background=dark
colorscheme solarized
"colorscheme Monokai

" Sets a ruler at 80 chars
set colorcolumn=80

" Enables move to the prvious or the next line after move left or right on
" line end.
"set whichwrap+=<,>,h,l,[,]

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

set mouse=n

" Show 7 lines of context around the cursor.
set scrolloff=7
set sidescrolloff=7

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

" Larger console window
set cmdwinheight=12


" ==============================================================================
" Key Mappings
" ==============================================================================

" Sets the mapleader (<leader>) to ,
let mapleader = ","

" I am to stupid to understand vims copy and paste from outside so there is
" the way to copy as in vim with a CTRL before.
nmap <C-P> "+gP
imap <C-P> <ESC><C-P>i
vmap <C-Y> "+y

" Close other windows
map <leader>wo :only<cr>

" Move in windows
map <leader>ww :wincmd w<cr>
map <leader>wh :wincmd h<cr>
map <leader>wj :wincmd j<cr>
map <leader>wk :wincmd k<cr>
map <leader>wl :wincmd l<cr>

" Scales a window 5 rows up and down or left and right with the arrow keys
" maybe sometimes i will switch to hjkl but at the moment its to strange for
" me.
map <C-left> :vertical resize -5<cr>
map <C-down> :resize +5<cr>
map <C-up> :resize -5<cr>
map <C-right> :vertical resize +5<cr>

" Sudo to write
cmap w!! silent write !sudo tee % >/dev/null


" ==============================================================================
" Configure Bundles
" ==============================================================================

" Toggle NerdTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" Other NerdTree options
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Fast, efficient file renaming
nmap R :let _pfn="<C-R>=expand("%:.")<cr>"<cr>q:iRename <C-R>=expand(_pfn)<cr><esc>^w

" Surround mappings
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround


" ==============================================================================
" Misc
" ==============================================================================

" Filetype detection extensions
au BufNewFile,BufRead *.twig set filetype=twig


" ==============================================================================
" GVim Options
" ==============================================================================

if has("gui_running")
  "remove menu bar
  set guioptions-=m

  "remove toolbar
  set guioptions-=T

  "remove right-hand scroll bar
  set guioptions-=r

  if strftime("%H") < 18 && strftime("%H") > 8
    set background=light
  else
    set background=dark
  endif
endif

" ==============================================================================
" Functions
" ==============================================================================

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

nmap <leader>clean :call CleanCode()<cr>
