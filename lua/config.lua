local set = vim.o

set.autoindent = true
set.timeoutlen = 500
set.tabstop = 4
set.shiftwidth = 4
set.mouse = ""
set.backspace = "indent,eol,start"
set.cursorline = true
set.ttyfast = true
set.number = true
set.incsearch = true
set.clipboard = 'unnamedplus'
set.splitkeep = 'screen'
set.signcolumn = "yes"
set.lazyredraw = true

vim.cmd
[[
	autocmd FileType vim let b:vcm_tab_complete = 'omni'
	autocmd FileType zig setlocal expandtab
	runtime macros/matchit.vim
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.zig_fmt_autosave = 0

vim.g['tex_flavor'] = 'lualatex'
vim.g['tex_conceal'] = 'abdmg'
vim.g['tex_conceal_frac'] = 1

vim.g['python_highlight_all'] = 1

vim.g.smartindent = 1
set.conceallevel = 2
vim.g['zig_fmt_autosave'] = 0

vim.g.maplocalleader = ","
vim.g.coq_settings =
{
  auto_start = 'shut-up',
  keymap =
  {
    recommended = true,
    jump_to_mark = "<c-m>",
  },
}

-- UltiSnip
--vim.g.UltiSnipsExpandTrigger = '<cr>'
--vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
--vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
vim.g.UltiSnipsSnippetDirectories = { os.getenv('HOME') .. '/.config/nvim/snips' }

-- Global
Lsp_keymap = require('keymap.lsp_keymaps')

Lsp = require('lspconfig')
Coq = require("coq")

vim.api.nvim_create_autocmd('TextYankPost',
{
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})
