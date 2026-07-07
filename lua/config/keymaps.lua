-- Set the leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Clear search highlights on pressing <Esc>
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Execute inline Lua code
keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
keymap.set("n", "<leader>x", ":.lua<CR>")
keymap.set("v", "<leader>x", ":lua<CR>")

-- Split
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split Horizontally" })

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
