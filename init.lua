local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'                  -- Ack for vim
Plug 'tpope/vim-commentary'             -- Comment in and out
Plug 'tpope/vim-surround'               -- surround parentheses, brackets, quotes, ...
Plug 'tpope/vim-fugitive'               -- Git tool
Plug 'tpope/vim-vinegar'                -- Open netrw with -
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'nvim-lualine/lualine.nvim'        -- status bar
Plug 'w0rp/ale'                         -- Linter
Plug 'andymass/vim-matchup'             -- highlight matching words
Plug 'farmergreg/vim-lastplace'         -- reopen files at your last edit position
Plug 'tpope/vim-markdown'               -- Markdown syntax
Plug 'rust-lang/rust.vim'               -- Rust syntax
Plug 'leafgarland/typescript-vim'       -- Typescript syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'udalov/kotlin-vim'                -- Kotlin syntax
Plug 'mattn/webapi-vim'                 -- VIM web client
Plug 'dennis84/cll'                     -- inserts printlns on `cll`
Plug 'unblevable/quick-scope'           -- highlight characters in current line for better use of `f`
Plug 'ruanyl/vim-gh-line'               -- ope line in guthub with `<leader>gh`
Plug 'folke/tokyonight.nvim'            -- colorscheme
Plug 'zakharykaplan/nvim-retrail'       -- show and remove trailing whitespace
vim.call('plug#end')

-- Sets the mapleader (<leader>) to ,
vim.g.mapleader = ","

vim.opt.smartindent = true	-- automatically inserts one extra level of indentation in some cases
vim.opt.expandtab = true		-- spaces instead tabs
vim.opt.tabstop = 2			 		-- tabs to two spaces
vim.opt.softtabstop = 2  		-- look and feel as if tabs were set
vim.opt.shiftwidth = 2      -- indent next line after if (x) with 2 spaces
vim.opt.smartcase = true    -- smart case
vim.opt.backup = false      -- no backups
vim.opt.writebackup = false -- no backups
vim.opt.updatetime = 300    -- Coc recommends less updatetime
vim.wo.number = true			  -- Enables line numbers
vim.wo.colorcolumn = 80  	  -- Sets a ruler at 80 chars
vim.o.mouse = false			 	  -- Disable the mouse.
vim.o.scrolljump = 5		 	  -- lines to scroll when cursor leaves screen.
vim.cmd[[set noswapfile]]   -- don't create swap files

-- Status bar
require('lualine').setup({
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = '',
  }
})

-- Colorscheme
require("tokyonight").setup({
  style = "night",
})

vim.cmd[[colorscheme tokyonight]]

require("retrail").setup()

local keymap = vim.keymap.set
local opts = { silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move to start/end with H/L. Maybe better stop using this.
keymap("", "H", "^", opts)
keymap("", "L", "$", opts)

-- Expand current file dir in console mode
keymap("c", "%%", "<C-R>=expand('%:h').'/'<cr>", opts)

-- Clear search highlight
keymap("n", "<leader>/", "<cmd>nohlsearch<CR>", opts)

-- Telescope
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.buffers, {})

-- Ale
vim.g.ale_java_checkstyle_config = '~/checkstyle.xml'
vim.g.ale_kotlin_kotlinc_config_file = '~/.editorconfig'
vim.g.ale_linters = {
  javascript = { 'eslint' },
	scala = {},
	kotlin = {},
	java = { 'checkstyle' },
}

-- CoC
-- Remap <cr> to make it confirms completion:
vim.cmd([[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])
-- Use <Tab> and <S-Tab> to navigate the completion list:
vim.cmd([[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]])

-- Ack
vim.g.ackprg = 'rg --vimgrep --no-heading'
