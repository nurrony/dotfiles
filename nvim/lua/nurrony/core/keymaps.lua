-- set leader key to space
vim.g.mapleader = " "

local mapkey = require("nurrony.utils.keymapper").mapvimkey

-- General Keymaps -------------------

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n", { desc = "Navigate left" }) -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n", { desc = "Navigate down" }) -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n", { desc = "Navigate up" }) -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n", { desc = "Navigate right" }) -- Navigate Right
mapkey("<C-h>", "wincmd h", "t", { desc = "[tmux]: Navigate left" }) -- Navigate Left
mapkey("<C-j>", "wincmd j", "t", { desc = "[tmux]: Navigate down" }) -- Navigate Down
mapkey("<C-k>", "wincmd k", "t", { desc = "[tmux]: Navigate up" }) -- Navigate Up
mapkey("<C-l>", "wincmd l", "t", { desc = "[tmux]: Navigate right" }) -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n", { desc = "Split vertically" }) -- Split Vertically
mapkey("<leader>sh", "split", "n", { desc = "Split horizontally" }) -- Split Horizontally
