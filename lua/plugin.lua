vim.o.termguicolors = true
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require('nvim-tree').setup
{
	view = 
	{
		mappings = 
		{
			list= {{key = 'V',cb = tree_cb('vsplit')}}
		}
	}
}


require'nvim-treesitter.configs'.setup 
{ highlight = 
	{
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
--require('telescope').setup()
require('telescope').setup
{
	defaults = 
	{
		layout_config = 
		{
		  vertical = { width = 0.5 }
		  -- other layout configuration here
		},
    -- other defaults configuration here
	},
	extensions =
	{
			
	}
  -- other configuration values here
}
require('nvim-autopairs').setup()
require'nvim-web-devicons'.setup 
{
 default = true;
}
