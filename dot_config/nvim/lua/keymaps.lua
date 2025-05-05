-- keymaps.lua

local keymap = vim.keymap.set

-- Nvim-Tree keybindings
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Debugger
-- Starta/fortsätt
keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>")
-- Stega över
keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>")
-- Stega in
keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>")
-- Stega ut
keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>")
-- Sätt/ta bort brytpunkt
keymap('n', '<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
-- Öppna DAP-UI
keymap('n', '<Leader>du', "<cmd>lua require'dapui'.toggle()<CR>")

