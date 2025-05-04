-- keymaps.lua

local keymap = vim.keymap.set

-- Nvim-Tree keybindings
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
