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

vim.g['latex_to_unicode_auto'] = 1
vim.g['tex_flavor'] = 'lualatex'
vim.g['vimtex_compiler_engine'] = 'lualatex'
vim.g['vimtex_compiler_method'] = 'latexmk' -- choose your preferred ones
vim.g['vimtex_view_general_viewer'] = 'zathura' -- install zathura
vim.g['python_highlight_all'] = 1
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

map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', {noremap = true})
map('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {noremap = true})
map('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {noremap = true})
map('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})
map('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})
map('n', '<Leader>fo', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', {noremap = true})
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap=true}) -- open up nvim tree
map('n', '<Leader> ', ':noh<CR>', {noremap=true}) 		 -- :noh
map('o', 'nc', '<cmd>normal! f{vi{<cr>', {noremap=true}) -- delete everything in the next curly bracket
map('o', 'nr', '<cmd>normal! f(vi(<cr>', {noremap=true}) -- delete everything in the next cy bracket

vim.g['tmux_navigator_no_mappings'] = 1 -- tmux navigation maps
map('n', "<c-h>", ":TmuxNavigateLeft<cr>", {noremap=true})
map('n', "<c-l>", ":TmuxNavigateRight<cr>", {noremap=true})
map('n', "<c-j>", ":TmuxNavigateDown<cr>", {noremap=true})
map('n', "<c-k>", ":TmuxNavigateUp<cr>", {noremap=true})
