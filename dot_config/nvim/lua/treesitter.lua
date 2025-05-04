-- treesitter.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "asm", "lua", "python", "cpp" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
