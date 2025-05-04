-- lsp.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lägga till OmniSharp för C#
lspconfig.omnisharp.setup({
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
})
