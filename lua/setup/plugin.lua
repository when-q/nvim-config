local M = {}
vim.o.termguicolors = true
function M.tree_setup()
  require('nvim-tree').setup
  {
    view =
    {
      mappings =
      {
        list = { { key = 'V', action = 'vsplit' } }
      }
    },
    update_focused_file =
    {
      enable = true,
      update_cwd = true,
    },
  }
end

function M.treesitter_setup()
  require 'nvim-treesitter.configs'.setup
  {
    highlight =
    {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

function M.pair_setup()
  require('nvim-autopairs').setup({
    map_cr = false,
    check_ts = true,
  })
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
      untracked = { folded = false },
      unstaged = { folded = false },
      staged = { folded = false },
      stashes = { folded = true },
      unpulled = { folded = true },
      unmerged = { folded = false },
      recent = { folded = true },
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

function M.which_key_setup()
  require('which-key').setup({
    plugins = {
      marks = true,
      registers = true,
    },
    presets = {
      operators = false, -- adds help for operators like d, y,
      -- ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    popup_mappings = {
      scroll_down = '<c-f>', -- binding to scroll down inside the popup
      scroll_up = '<c-b>', -- binding to scroll up inside the popup
    },
    triggers = {"<space>", "g", "\\", "z",","},
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
  })

end

function M.telescope_setup()
  local present, telescope = pcall(require, "telescope")

  vim.cmd [[
		highlight TelescopePromptBorder guifg=#eeeeee      guibg=none     gui=none
		highlight TelescopeResultsBorder guifg=#eeeeee      guibg=none     gui=italic
		highlight TelescopePreviewBorder guifg=#eeeeee      guibg=none     gui=none
	]]
  local options = require("setup.utils.tscope").telescope_options()
  telescope.setup(options)
end

function M.trouble_setup()
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    use_diagnostic_signs = true,
  }
end

function M.todo_setup()
  require("todo-comments").setup()
end

return M
