local set = vim.o
local map = vim.api.nvim_set_keymap

set.autoindent = true
set.tabstop=4
set.shiftwidth=4
set.mouse='a'
set.backspace="indent,eol,start"
set.cursorline = true
set.ttyfast = true
set.number = true
set.incsearch = true
set.clipboard='unnamedplus'

vim.cmd
[[
	runtime macros/matchit.vim
]]

vim.g.smartindent = 1
vim.g.mapleader = ' ' 
set.conceallevel= 2
vim.opt.concealcursor = 'nc'
vim.g.maplocalleader =","
vim.g.coq_settings = 
{
	auto_start = 'shut-up', 
    clients=
	{
		snippets = { warn = {} }
	},
	keymap = {jump_to_mark = "<c-m>"} 
}


