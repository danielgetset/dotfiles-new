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

-- Funktion som anropas när nvim-tree öppnas, för att sätta keybindings
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  -- Hjälpfunktion för att sätta tangentbeskrivningar och andra mapinställningar
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  local keymap = vim.keymap.set

  -- Tangentmappningar för att navigera och arbeta med filer/mappar i trädet
  keymap("n", "l", api.node.open.edit, opts("Öppna fil eller mapp"))
  keymap("n", "h", api.node.navigate.parent_close, opts("Stäng mapp"))
  keymap("n", "v", api.node.open.vertical, opts("Öppna i vertical split"))
  keymap("n", "s", api.node.open.horizontal, opts("Öppna i horizontal split"))
  keymap("n", "t", api.node.open.tab, opts("Öppna i ny tab"))

  -- Filoperationer
  keymap("n", "a", api.fs.create, opts("Skapa ny fil eller mapp"))
  keymap("n", "d", api.fs.remove, opts("Radera fil eller mapp"))
  keymap("n", "r", api.fs.rename, opts("Byt namn på fil eller mapp"))
  keymap("n", "x", api.fs.cut, opts("Klipp ut"))
  keymap("n", "c", api.fs.copy.node, opts("Kopiera"))
  keymap("n", "p", api.fs.paste, opts("Klistra in"))

  -- Kopiera namn eller sökvägar
  keymap("n", "y", api.fs.copy.filename, opts("Kopiera filnamn"))
  keymap("n", "Y", api.fs.copy.relative_path, opts("Kopiera relativ sökväg"))
  keymap("n", "gy", api.fs.copy.absolute_path, opts("Kopiera absolut sökväg"))
end

-- Här konfigureras själva nvim-tree
require("nvim-tree").setup({
  on_attach = my_on_attach, -- Använd vår keybinding-funktion ovan
  view = {
    width = 30, -- Trädets bredd i tecken
    side = "left", -- Visa trädet på vänster sida
    preserve_window_proportions = true, -- Bevara fönsterstorlek när man öppnar filer
  },
  renderer = {
    group_empty = true, -- Gruppera tomma mappar som t.ex. "src/components"
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true, -- Visa git-statusikoner
      },
    },
  },
  filters = {
    dotfiles = false, -- false = visa dolda filer (t.ex. .gitignore)
  },
  git = {
    enable = true,
    ignore = false, -- false = visa även filer som är ignorerade av .gitignore
  },
  actions = {
    open_file = {
      resize_window = true, -- Autojustera fönsterstorlek vid öppning
    },
  },
})

require("config.format");
