local set = vim.o

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
	autocmd FileType vim let b:vcm_tab_complete = 'omni'
	autocmd FileType zig setlocal expandtab
	runtime macros/matchit.vim
	autocmd BufNewFile,BufRead *.lagda.md set filetype=agda.markdown
]]

vim.g['latex_to_unicode_auto'] = 1
vim.g['tex_flavor'] = 'lualatex'
vim.g['vimtex_compiler_engine'] = 'lualatex'
vim.g['vimtex_compiler_method'] = 'latexmk'
vim.g['vimtex_quickfix_mode']   = 0
vim.g['vimtex_view_general_viewer'] = 'skim' -- install skim
vim.g['tex_conceal'] = 'abdmg'
vim.g['python_highlight_all'] = 1
vim.g.smartindent = 1
vim.g.mapleader = ' ' 
set.conceallevel= 1
vim.g['zig_fmt_autosave'] = 0

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

vim.g['cornelis_split_location'] = 'right'
vim.g['cornelis_agda_prefix'] = '\\'
