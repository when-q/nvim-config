vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

--[[
Lsp['clangd'].setup
{
  on_attach = Lsp_keymap.on_attach,
  capabilities = Coq.lsp_ensure_capabilities(),
  handler = Handlers
}
--]]
