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
  use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'catppuccin/nvim'

  use 'sainnhe/everforest'
  use 'rebelot/heirline.nvim'
  
  use 'christoomey/vim-tmux-navigator'
  use 
  {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/plenary.nvim'}
  }
  use
  {
	'vim-autoformat/vim-autoformat',
	ft = 'py'
  }
  use 'ms-jpq/coq_nvim'
  use
  {
	'TimUntersberger/neogit',
	requires =
	{
	  'nvim-lua/plenary.nvim',
	  'sindrets/diffview.nvim'
	}
  }
  use
  {
	'lervag/vimtex',
	ft = 'tex'
  }
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-autopairs'
  use 'nvim-treesitter/nvim-treesitter'
  use 
  {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
  }
  use 
  {
	'ziglang/zig.vim',
	ft = {'zig'}
  }
  use
  {
	'isovector/cornelis',
	run = 'stack build',
	requires =
	{
	  'neovimhaskell/nvim-hs.vim',
	  'kana/vim-textobj-user',
	  'liuchengxu/vim-which-key'
	}
  }
  use 
  {
    'Julian/lean.nvim',
    requires =
    {
      'nvim-lua/plenary.nvim',
      'tomtom/tcomment_vim'
    }
  }
  use 'ellisonleao/glow.nvim'
  use 'SirVer/ultisnips'
  use 'ggandor/leap.nvim'
  use 'KeitaNakamura/tex-conceal.vim'
  use 'jakewvincent/texmagic.nvim'
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  if packer_bootstrap then
    require('packer').sync()
  end
end)
