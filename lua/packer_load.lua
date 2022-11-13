local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  -- sourcing configurations with plugin
  local plugin = require("setup.plugin")
  local lang = require("setup.lang")

  use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'rebelot/heirline.nvim'
  use 'lewis6991/impatient.nvim'
  use
  {
    'ms-jpq/coq_nvim',
    requires =
    {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts', opt = true },
      { 'ms-jpq/coq.thirdparty', branch = '3p', opt = true }
    }
  }
  use 'neovim/nvim-lspconfig'

  use 'christoomey/vim-tmux-navigator'
  use
  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = plugin.telescope_setup
  }

  use
  {
    'TimUntersberger/neogit',
    requires =
    {
      'nvim-lua/plenary.nvim',
      { 'sindrets/diffview.nvim', opt = true }
    },
    config = plugin.neogit_setup,
    cmd = "Neogit",
  }

  use
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = plugin.pair_setup,
  }
  use
  {
    'nvim-treesitter/nvim-treesitter',
    config = plugin.treesitter_setup,
  }
  use
  {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = plugin.tree_setup
  }
  use
  {
    'ellisonleao/glow.nvim',
    config = plugin.glow_setup,
    ft = { 'md' }
  }
  use
  {
    'ggandor/leap.nvim',
    config = plugin.leap_setup
  }
  use
  {
    'folke/which-key.nvim',
    config = plugin.which_key_setup,
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
