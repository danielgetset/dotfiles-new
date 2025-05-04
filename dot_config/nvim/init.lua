-- init.lua

-- 🚀 Lazy plugin manager
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/lazy/start/lazy.nvim")

-- Ladda LazyVim och plugin-konfigurationer
require("lazy").setup(require("plugins"))

-- 🌟 Ladda UI-inställningar
require("ui")

-- Ladda LSP-konfigurationer
require("lsp")

-- Ladda autocompletion och snippets
require("plugin-cmp")

-- Ladda keymaps
require("keymaps")

-- Ladda Nvim-Tree
require("plugin-nvim-tree")

-- Ladda Treesitter
require("treesitter")

-- Ladda Formatter
require("format");
