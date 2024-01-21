-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.cmd[[set noswapfile]]

vim.g.autoformat = false

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono:h22"
end
