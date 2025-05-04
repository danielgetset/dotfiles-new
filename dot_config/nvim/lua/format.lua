--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*.cs",
--  callback = function()
--    local project_dir = vim.fn.getcwd()
--    vim.fn.jobstart({ "dotnet", "format" }, {
--      cwd = project_dir,
--      detach = true,
--    })
--  end,
--})
-- Formatera med LSP vid save för C#
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

