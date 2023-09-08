local set = vim.o
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
set.autoindent = true
set.timeoutlen = 200
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
	runtime macros/matchit.vim
  set tags+=~/.local/include/tags
]]

--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

vim.g['tex_conceal_frac'] = 1
vim.g['python_highlight_all'] = 1

vim.g['tex_flavor'] = 'lualatex'
vim.g['tex_conceal'] = 'abdmg'
vim.g.vimtex_compiler_engine = 'lualatex'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  callback = 1,
  executable = 'latexmk',
  options = {
    '-shell-escape',
    '-file-line-error',
    '-silent',
    '-pv',
    '-file-line-error',
    '-synctex=1',
    --    '-interaction=nonstopmode',
    --    '-output-directory=output',
  }
}

vim.g.smartindent = 1
set.conceallevel = 2

vim.g.maplocalleader = ","

-- UltiSnip
--[[ vim.g.UltiSnipsExpandTrigger = ' '
vim.g.UltiSnipsJumpForwardTrigger = ' '
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
vim.g.UltiSnipsSnippetDirectories = { os.getenv('HOME') .. '/.config/nvim/snips' }
--]]
-- Global
Lsp_keymap = require('keymap.lsp_keymaps')

Lsp = require('lspconfig')
Coq = require("coq")
vim.g.haskell_disable_TH = 1
vim.g.haskell_classic_highlighting = 1
set.fillchars = "vert: ,eob: "
