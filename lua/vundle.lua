vim.cmd [[
	let &packpath=&runtimepath
	set nocompatible
	syntax enable
	filetype off
	set rtp+=~/.config/nvim/bundle/Vundle.vim

	call vundle#begin('~/.config/nvim/bundle/')

	Plugin 'VundleVim/Vundle.vim'
	Plugin 'srcery-colors/srcery-vim'
	Plugin 'rebelot/kanagawa.nvim'
	Plugin 'rebelot/heirline.nvim'

	Plugin 'itchyny/vim-gitbranch'
"	Plugin 'ajh17/vimcompletesme'
	Plugin 'JuliaEditorSupport/julia-vim'
	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'lervag/vimtex'

	Plugin 'neovim/nvim-lspconfig'
	Plugin 'windwp/nvim-autopairs'
	Plugin 'nvim-treesitter/nvim-treesitter'
	Plugin 'kyazdani42/nvim-web-devicons'
	Plugin 'kyazdani42/nvim-tree.lua'
	Plugin 'nvim-lua/plenary.nvim'
	Plugin 'nvim-telescope/telescope.nvim'
	Plugin 'vim-autoformat/vim-autoformat'
	Plugin 'ms-jpq/coq_nvim'
	

	Plugin 'Julian/lean.nvim'
	Plugin 'hrsh7th/nvim-cmp'        " For LSP completion
	Plugin 'hrsh7th/vim-vsnip'       " For snippets
	Plugin 'tomtom/tcomment_vim'     " For commenting motions


	call vundle#end()           

	filetype plugin indent on
]]
