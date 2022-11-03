local M = {}
local map = vim.api.nvim_set_keymap
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
	require('lean').setup{
		infoview = {width = 30}
	}

end
return M
