local M = {}
-- map the leader key
-- 'vim.g' sets global variables

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '\\e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '\\q', vim.diagnostic.setloclist, opts)

function M.on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '\\wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '\\wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '\\wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '\\D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '\\rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '\\ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gK', vim.diagnostic.open_float, bufopts)

	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '\\f', function() vim.lsp.buf.format { async = true } end, bufopts)

end


return M
