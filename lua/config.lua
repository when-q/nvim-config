local set = vim.o

set.autoindent = true
set.tabstop    = 4
set.shiftwidth = 4
set.mouse      = 'a'
set.backspace  = "indent,eol,start"
set.cursorline = true
set.ttyfast    = true
set.number     = true
set.incsearch  = true
set.clipboard  = 'unnamedplus'
set.timeoutlen = 500

vim.cmd
[[
  runtime macros/matchit.vim
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.smartindent = 1
set.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.g.coq_settings =
{
  auto_start = 'shut-up',
  clients =
  {
    snippets = { warn = {} },
  },
  keymap =
  {
    jump_to_mark = "<c-m>", -- <c-h> conficts with vim-tmux
  },
}

-- Global
Lsp_keymap = require('keymap.lsp_keymaps')
Lsp = require('lspconfig')
Coq = require("coq") -- add this
