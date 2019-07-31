" Must be first line
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'                     " AG for vim
Plug 'tpope/vim-sensible'               " a universal set of defaults
Plug 'tpope/vim-commentary'             " Comment in and out
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
Plug 'unblevable/quick-scope'
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

command! MakeTags !ctags -R .

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

" Denite

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change matchers.
call denite#custom#source(
  \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
  \ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
  \ 'file/rec', 'sorters', ['sorter/sublime'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
  \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
 \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',['scantree.py'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
 \ [ '.git/', '.ropeproject/', '__pycache__/',
 \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#option('default', {
 \ 'auto_resize': 1,
 \ 'auto_resume': 1,
 \ 'winheight': 15,
 \ 'winminheight': -1,
 \ 'reversed': 0,
 \ 'prompt': '❯',
 \ 'start_filter': 1,
 \ })

nnoremap <leader>p :<C-u>Denite file/rec<cr>
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

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'scala': [],
\  'java': ['checkstyle'],
\}

let g:ale_java_checkstyle_config = '~/checkstyle.xml'
