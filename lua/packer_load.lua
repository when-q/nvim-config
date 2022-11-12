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
  local lang   = require("setup.lang")

  use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'catppuccin/nvim'
  use 'lewis6991/impatient.nvim'
  use 'rebelot/heirline.nvim'
  use
  {
    'ms-jpq/coq_nvim',
    requires =
    {
      {'ms-jpq/coq.artifacts', branch = 'artifacts', opt=true},
      {'ms-jpq/coq.thirdparty', branch = '3p', opt=true}
    }
  }
  use 'SirVer/ultisnips'

  use 'christoomey/vim-tmux-navigator'
  use
  {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/plenary.nvim'},
	  config = plugin.telescope_setup()
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
	  {'sindrets/diffview.nvim', opt=true},
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
		config = plugin.treesitter_setup
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
    requires = {'nvim-lua/plenary.nvim',},
	config = lang.lean_setup,
	ft = {'lean'}
  }
  use
  {
	  'ellisonleao/glow.nvim',
      ft = {'md'},
	  config = plugin.glow_setup
  }

  use {'KeitaNakamura/tex-conceal.vim', ft={'tex'}}
  use
  {
	'jakewvincent/texmagic.nvim',
  	ft = {'tex'},
	config = lang.tex_setup
  }
  use
  {
	'scalameta/nvim-metals',
  	requires = {"nvim-lua/plenary.nvim"},
	config = lang.scala_setup,
    ft = { "scala", "sbt"}

  }
  use
  {
	  'ggandor/leap.nvim',
	  config = plugin.leap_setup
  }
  use
  {
    'ziglang/zig.vim',
    ft = {'zig'}
  }
  use
  {
	  'ShinKage/idris2-nvim',
	  requires = {'MunifTanjim/nui.nvim', opt=true},
	  ft = {'idr'}
  }
  use
  {
	  'folke/which-key.nvim',
	  config = plugin.which_key_setup,
  }
  use
  {
    'folke/trouble.nvim',
    requires = {"kyazdani42/nvim-web-devicons", opt=true},
    config = plugin.trouble_setup,
    keys = {"<leader>t"}
  }
  use
  {
    'folke/todo-comments.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = plugin.todo_setup,
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
