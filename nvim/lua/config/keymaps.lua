-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 1. Terminal Mode Ergonomics
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- 2. Symbol Navigation (LSP)
map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Symbol: Seek in buffer" })
map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Symbol: Seek in project" })

-- 3. Miscellaneous
map("n", "<leader>uz", "<cmd>set relativenumber!<cr>", { desc = "Toggle Relative Number" })
