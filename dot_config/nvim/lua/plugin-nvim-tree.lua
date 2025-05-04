-- nvim-tree.lua

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  
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

require("nvim-tree").setup({
  on_attach = my_on_attach,
})

