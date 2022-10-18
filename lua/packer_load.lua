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
  use 'rebelot/heirline.nvim'
  
  use 'christoomey/vim-tmux-navigator'
  use 
  {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/plenary.nvim'}
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
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-autopairs'


  use 'nvim-treesitter/nvim-treesitter'
  use 
  {
    'nvim-tree/nvim-tree.lua',
    requires = 
    {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }


  use 'ellisonleao/glow.nvim'
  use 'gennaro-tedesco/nvim-peekup'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
