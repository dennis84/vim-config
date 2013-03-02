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

" Sets the mapleader (<leader>) to ,
let mapleader = ","


" ==============================================================================
" Bundles to install and load
" ==============================================================================

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'ervandew/supertab'
Bundle 'wojtekmach/vim-rename'
Bundle 'derekwyatt/vim-scala'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'slack/vim-bufexplorer'
Bundle 'gre/play2vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'daveray/vimclojure-easy'
Bundle 'groenewege/vim-less'
Bundle 'Shougo/neocomplcache'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'


" ==============================================================================
" Global Stuff
" ==============================================================================

" Enables the syntax highlighting
syntax on

" Set filetype stuff to on
filetype plugin indent on

" Colorsheme
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_menu=0
let g:solarized_italic=0
set background=dark
colorscheme solarized

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


" ==============================================================================
" Key Mappings
" ==============================================================================

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

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 'infercase'
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_insert_char_pre = 1
let g:neocomplcache_temporary_dir = '~/.cache/neocon'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Set a mark then search with Ack
nmap <leader>a mA:Ack<space>

" Set a mark, then pull word under cursor into Ack for a global search
nmap <leader>za mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>zA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

let g:ctrlp_working_path_mode = 2
let g:ctrlp_map = '<leader>mf'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': ''
  \ }


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

nmap <leader>cc :call CleanCode()<cr>
