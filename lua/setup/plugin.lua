local M = {}
vim.o.termguicolors = true
function M.tree_setup()
	require('nvim-tree').setup
	{
	  view =
	  {
		mappings =
		{
		  list= {{key = 'V',action ='vsplit'}}
		}
	  },
	  update_focused_file =
	  {
		enable = true,
		update_cwd = true,
	  },
	}
end

function M.ts_setup()
	require'nvim-treesitter.configs'.setup
	{ highlight =
	  {
		enable = true,
		additional_vim_regex_highlighting = false,
	  },
	}
end
function M.pair_setup()
	require('nvim-autopairs').setup()
end

function M.neogit_setup()
	require("neogit").setup
	{
	  auto_refresh = true,
	  disable_builtin_notifications = false,
	  use_magit_keybindings = false,
	  -- Change the default way of opening neogit
	  kind = "tab",
	  -- Change the default way of opening the commit popup
		-- customize displayed signs
	  integrations =
	  {
		diffview = true
	  },
	  -- Setting any section to `false` will make the section not render at all
	  sections = {
		untracked = {folded = false},
		unstaged = {folded = false},
		staged = {folded = false},
		stashes = {folded = true},
		unpulled = {folded = true},
		unmerged = {folded = false},
		recent = {folded = true},
	  },
	  -- override/add mappings
	 }
end

function M.glow_setup()
	require('glow').setup(
	{
	  style = "dark",
	  width = 120,
	})
end

--require('leap').add_default_mappings()


function M.leap_setup()
	require('leap').setup
	{
		case_sensitive = true,
	}
end

function M.lean_setup()
	require('lean').setup
	{
	  abbreviations = { builtin = true },
	  lsp = {on_attach = require('setup.lsp_keymaps').on_attach},
	  infoview = {width = 30},
	  mappings = true,
	}

end
function M.scala_setup()
	local metals_config = require("metals").bare_config()
--	local capabilities = vim.lsp.protocol.make_client_capabilities()
	metals_config.capabilities = require("coq").lsp_ensure_capabilities()
	local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

	metals_config.on_attach = require('setup.lsp_keymaps').on_attach
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

return M
