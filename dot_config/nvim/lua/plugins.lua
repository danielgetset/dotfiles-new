-- plugins.lua
return {
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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
