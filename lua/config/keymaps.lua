-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { silent = true }

-- Move to start/end with H/L.
keymap("", "H", "^", opts)
keymap("", "L", "$", opts)
