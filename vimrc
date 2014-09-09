" Must be first line
set nocompatible
filetype off

" Setup vundle bundle manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Sets the mapleader (<leader>) to ,
let mapleader = ","

Bundle 'gmarik/vundle'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fireplace'
Bundle 'derekwyatt/vim-scala'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'tsukkee/unite-tag'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'rodjek/vim-puppet'
Bundle 'guns/vim-clojure-highlight'
Bundle 'guns/vim-clojure-static'
Bundle 'dennis84/vim-collab'

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme
set background=dark

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  colorscheme solarized
endif

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

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**

" Close other windows
map <leader>wo :only<cr>

" Move in windows
map <leader>ww :wincmd w<cr>
map <leader>wh :wincmd h<cr>
map <leader>wj :wincmd j<cr>
map <leader>wk :wincmd k<cr>
map <leader>wl :wincmd l<cr>

" Clear search highlight
nmap <silent> <leader>/ :nohl<cr>

noremap H ^
noremap L $

" Show tig
nmap <silent>ti :!tig status<cr>

" Toggle NerdTree
map <leader>e :NERDTreeToggle<CR>:NERDTreeMirror<CR>
 
" Other NerdTree options
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Surround mappings
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround

" Syntastic
let g:syntastic_javascript_jshint_conf = "~/.vim/syntastic/jshint.json"

" neocomplete
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Unite
nnoremap <leader>mf :<C-u>Unite -no-split -start-insert file_rec<cr>
nnoremap <leader>o :<C-u>Unite -no-split -start-insert outline<cr>
nnoremap <leader>t :<C-u>Unite -no-split -start-insert tag<cr>
autocmd BufEnter *
\  if empty(&buftype)
\|   nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<cr>
\| endif

" CTAGS
nmap <leader>ct :!ctags -R .&<cr><cr>

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
