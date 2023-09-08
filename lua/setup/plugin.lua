local M = {}

vim.o.termguicolors = true

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'V', api.node.open.vertical, opts('Open: Vertical Split'))
end

function M.tree_setup()
  require('nvim-tree').setup
  {
    update_focused_file =
    {
      enable = true,
      update_cwd = false,
    },
    on_attach = on_attach,
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
  require("neogit").setup()
end

function M.glow_setup()
  require('glow').setup(
    {
      style = "dark",
      width = 120,
    })
end

-- Run setup and specify two custom build engines
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
    triggers = "auto",
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
function M.gitsign_setup()
  require('gitsigns').setup()
end
function M.registers_setup()
  require("registers").setup({
	bind_keys = {
	  normal = false, 
	  insert = false
	}
  })
end

return M
