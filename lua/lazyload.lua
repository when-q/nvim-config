local plugin = require("setup.plugin")
local lang   = require("setup.lang")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- sourcing configurations with plugin

  {'wbthomason/packer.nvim'},
  {'rebelot/kanagawa.nvim'},
  {'rebelot/heirline.nvim'},
  {'lewis6991/impatient.nvim'},
  {
    'ms-jpq/coq_nvim',
    dependencies =
    {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts', lazy = true },
      { 'ms-jpq/coq.thirdparty', branch = '3p', lazy = true }
    },
  },

  {'neovim/nvim-lspconfig', lazy = true},

  {'christoomey/vim-tmux-navigator'},

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = plugin.telescope_setup
  },

  {
    'TimUntersberger/neogit',
    dependencies =
    {
      'nvim-lua/plenary.nvim',
      {'sindrets/diffview.nvim', lazy = true }
    },
    config = plugin.neogit_setup,
    cmd = "Neogit",
	lazy = true
  },

  {
    'windwp/nvim-autopairs',
    config = plugin.pair_setup,
    event = 'InsertEnter',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = plugin.treesitter_setup,
	lazy = true
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = plugin.tree_setup,
  },
  {
    'ellisonleao/glow.nvim',
    config = plugin.glow_setup,
	lazy = true
  },
  {
    'ggandor/leap.nvim',
    config = plugin.leap_setup
  },
  {
    'folke/which-key.nvim',
    config = plugin.which_key_setup,
  },
})
