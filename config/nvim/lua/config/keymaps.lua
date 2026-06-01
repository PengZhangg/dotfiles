-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- shift-tab to inverse tab
keymap.set("c", "<S-Tab>", "<C-d>", { desc = "Shift-Tab for command mode" })
keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Shift-Tab for insert mode" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Only set this up if we're in a tmux session
if os.getenv("TMUX") then
    keymap.del("n", "<C-h>")
    keymap.del("n", "<C-j>")
    keymap.del("n", "<C-k>")
    keymap.del("n", "<C-l>")
    keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
    keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
    keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
    keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end