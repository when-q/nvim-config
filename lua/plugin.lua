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
		  vertical   = { width = 0.5 }
		  -- other layout configuration here
		},
    -- other defaults configuration here
	},
	pickers = 
	{
		find_files = 
		{
			theme = "dropdown",
		}
	},
	extensions={}
  -- other configuration values here
}
require('nvim-autopairs').setup()
require'nvim-web-devicons'.setup 
{
 default = true;
}

require("neogit").setup {
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
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    --
    diffview = false  
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


-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/school/notes/**/*', '~/Personal/org/*'},
  org_default_notes_file = '~/Personal/org/personal_track.org',
  org_custom_exports = {
    f = {
      label = 'Export to html format',
      action = function(exporter)
        local current_file = vim.api.nvim_buf_get_name(0)
        local target = vim.fn.fnamemodify(current_file, ':p:r')..'.html'
        local command = {'pandoc', current_file, '-o', target}
        local on_success = function(output)
          print('Success!')
          vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
        end
        local on_error = function(err)
          print('Error!')
          vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
        end
        return exporter(command , target, on_success, on_error)
      end
    }
  }
})
