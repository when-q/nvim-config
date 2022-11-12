local M = {}
function M.lean_setup()
	require('lean').setup
	{
	  abbreviations = { builtin = true },
	  lsp = {on_attach = require('keymap.lsp_keymaps').on_attach},
	  infoview = {width = 30},
	  mappings = true,
	}
end

function M.scala_setup()
	local metals_config = require("metals").bare_config()
--	local capabilities = vim.lsp.protocol.make_client_capabilities()
	metals_config.capabilities = require("coq").lsp_ensure_capabilities()
	local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

	metals_config.on_attach = require('keymap.lsp_keymaps').on_attach
	  -- NOTE: You may or may not want java included here. You will need it if you
      --
	vim.api.nvim_create_autocmd("FileType", {
	  -- NOTE: You may or may not want java included here. You will need it if you
	  -- want basic Java support but it may also conflict if you are using
	  -- something like nvim-jdtls which also works on a java filetype autocmd.
	  pattern = { "scala", "sbt", "java" },
	  callback = function()
		require("metals").initialize_or_attach(metals_config)
	  end,
	  group = nvim_metals_group,
	})
end

function M.tex_setup()
	require('texmagic').setup
	{
		engines = {
		 lualatex = {    -- This is *not* one of the defaults, but it can be
						 -- called via magic comment if defined here
			 executable = "latexmk",
			 args = {
				 "-pdflua",
				 "-interaction=nonstopmode",
				 "-synctex=1",
				 "-pv",
				 "%f"
			 },
			 isContinuous = true
		 }
		 }
	}
end
return M
