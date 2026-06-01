-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable netrw's default mappings to avoid conflicts with vim-tmux-navigator
vim.g.tmux_navigator_disable_netrw = 1

-- Disable vim-tmux-navigator's default mappings so you can set your own
vim.g.tmux_navigator_no_mappings = 1

-- vim-tmux-navigator custom key mappings
vim.api.nvim_set_keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", { noremap = true, silent = true })

-- Set the compiler to use the Makefile in the Neovim configuration directory
vim.opt.makeprg = "make -f ~/.config/nvim/Makefile FILE=%"

-- Key mapping to compile and run the current file using :make
vim.api.nvim_set_keymap('n', '<leader>m', ':make<CR>', { noremap = true, silent = true })


