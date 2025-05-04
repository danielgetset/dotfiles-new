-- 🌟 ui.lua

-- Grundläggande UI och editorinställningar
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = false

-- Färgtema
vim.cmd.colorscheme("catppuccin")

-- Lualine
require("lualine").setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
    section_separators = "",
    component_separators = "",
  },
})

-- Nvim-Tree
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
})

-- Highlighta yanked text kort
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
