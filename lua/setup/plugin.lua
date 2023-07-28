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
  require 'nvim-treesitter.configs'.setup(
    {
      indent = { enable = true },
      highlight =
      {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })
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
      operators = false,    -- adds help for operators like d, y,
      -- ... and registers them for motion / text object completion
      motions = false,      -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = true,             -- bindings for prefixed with g
    },
    popup_mappings = {
      scroll_down = '<c-f>', -- binding to scroll down inside the popup
      scroll_up = '<c-b>',   -- binding to scroll up inside the popup
    },
    triggers = { "<space>", "g", "\\", "z", "," },
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
  require("trouble").setup({
    use_diagnostic_signs = true,
  })
end

function M.todo_setup()
  require("todo-comments").setup()
end

function M.luasnip_setup()
  local ls = require('luasnip')
  local i = ls.insert_node
  local t = ls.text_node
  local s = ls.snippet
  ls.config.setup({ enable_autosnippets = true })
  ls.add_snippets('cpp', {
    s('cout', {
      t({ 'std::cout << "', i(1), '" << std::endl;' }),
    })
  })
end

function M.nvim_daps()
  local dap = require('dap')
  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      -- CHANGE THIS to your path!
      command = '/Users/me/.local/codelldb/extension/adapter/codelldb',
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    }
  }
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
  require("dapui").setup()
end

return M
