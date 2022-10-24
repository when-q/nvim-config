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
  },
  update_focused_file = 
  {
	enable = true,
    update_cwd = true,
  },
}


require'nvim-treesitter.configs'.setup 
{ highlight = 
  {
	enable = true,
	additional_vim_regex_highlighting = false,
  },
}
require('nvim-autopairs').setup()
require'nvim-web-devicons'.setup 
{
  default = true;
}

require("neogit").setup
{
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  kind = "tab",
  -- Change the default way of opening the commit popup
  commit_popup = {kind = "split",},
  -- Change the default way of opening popups
  popup = {kind = "split",},
  -- customize displayed signs
  signs = 
  {
    -- { CLOSED, OPENED }
	section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations =
  {

    --
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
  mappings = 
  {
    -- modify status buffer mappings
--    status = {  }
  }
}
require('glow').setup(
{
  style = "dark",
  width = 120,
})

--require('leap').add_default_mappings()
require('leap').setup 
{
        case_sensitive = true,
}


-- Run setup and specify two custom build engines
require('texmagic').setup{
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
