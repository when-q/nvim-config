local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  local plugin = require("setup.plugin")
  use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'catppuccin/nvim'
  use 'lewis6991/impatient.nvim'
  use 'rebelot/heirline.nvim'
  use 'ms-jpq/coq_nvim'
  use 'SirVer/ultisnips'

  use 'christoomey/vim-tmux-navigator'
  use
  {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/plenary.nvim'},
  }
  use
  {
	'vim-autoformat/vim-autoformat',
	ft = 'py'
  }
  use
  {
	'TimUntersberger/neogit',
	requires =
	{
	  'nvim-lua/plenary.nvim',
	  'sindrets/diffview.nvim'
	},
	config = plugin.neogit_setup,
	cmd = "Neogit",
  }

  use 'neovim/nvim-lspconfig'
  use
  {
	  'windwp/nvim-autopairs',
	  event = 'InsertEnter',
	  config = plugin.pair_setup,
  }
  use
  {
	  'nvim-treesitter/nvim-treesitter',
		config = plugin.ts_setup
  }
  use
  {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
	config = plugin.tree_setup,
  }

  use
  {
    'Julian/lean.nvim',
    requires =
    {
      'nvim-lua/plenary.nvim',
      'tomtom/tcomment_vim'
    },
	config = plugin.lean_setup,
	ft = {'lean'}
  }
  use
  {
	  'ellisonleao/glow.nvim',
	  config = plugin.glow_setup
  }

  use {'KeitaNakamura/tex-conceal.vim', ft={'tex'}}
  use
  {
	'jakewvincent/texmagic.nvim',
  	ft = {'tex'},
	config = plugin.tex_setup
  }
  use
  {
	'scalameta/nvim-metals',
  	requires = {"nvim-lua/plenary.nvim"},
	config = plugin.scala_setup

  }
  use
  {
	  'ggandor/leap.nvim',
	  config = plugin.leap_setup
  }
  use 'ziglang/zig.vim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
