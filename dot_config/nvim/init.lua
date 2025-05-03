-- 🌟 Grundläggande UI och editorinställningar
vim.opt.number = true            -- Visa radnummer
vim.opt.relativenumber = true    -- Visa relativa radnummer
vim.opt.tabstop = 4              -- Tabbar = 4 mellanslag
vim.opt.shiftwidth = 4           -- Auto-indent = 4 mellanslag
vim.opt.expandtab = true         -- Använd mellanslag istället för tab
vim.opt.smartindent = true       -- Automatisk indentering
vim.opt.mouse = "a"              -- Aktivera mus
vim.opt.termguicolors = true     -- Snyggare färger
vim.opt.clipboard = "unnamedplus" -- Systemclipboard
vim.opt.scrolloff = 8            -- Marginal när du scrollar
vim.opt.signcolumn = "yes"       -- Alltid visa tecken-kolumn (för LSP)
vim.opt.cursorline = true        -- Highlighta raden där markören är
vim.opt.wrap = false             -- Inget radbryt

-- Highlighta yanked text kort
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- init.lua
-- vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

-- 🚀 Lazy plugin manager
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/lazy/start/lazy.nvim")

require("lazy").setup({
  -- 🧠 LSP
  { "neovim/nvim-lspconfig" },

  -- 🧠 Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- 🎨 Tema & UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" }, -- Ikoner till träd och statusrad
})


-- 🎨 Tema
vim.cmd.colorscheme("catppuccin")

-- 📦 LSP - OmniSharp
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


lspconfig.omnisharp.setup({
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
})

-- 🤖 Autocomplete
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

-- 📊 Statusrad
require("lualine").setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
    section_separators = "",
    component_separators = "",
  },
})

-- 🌲 Trädvy
require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
