local set_keymap = vim.api.nvim_set_keymap

-- map the leader key
 -- 'vim.g' sets global variables

options = {noremap = true }

function _map(mode, shortcut, command)
	set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	_map('n', shortcut, command)
end

nmap('<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')


--require'lspconfig'.julials.setup{}
--require'lspconfig'.zls.setup{}
--require'lspconfig'.pyright.setup{}
--require'lspconfig'.clangd.setup{}
local lsp = require "lspconfig"
local coq = require "coq" -- add this

require'lspconfig'.pyright.setup(coq.lsp_ensure_capabilities())-- after
require'lspconfig'.clangd.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.metals.setup(coq.lsp_ensure_capabilities())
vim.g['coq_settings.keymap.manual_complete'] = "tab"

--require'lspconfig'.leanls.setup{}
--commenting out because conflicts with lean.nvim
require('lean').setup
{
	abbreviations = { builtin = true },
	lsp = { on_attach = on_attach },
	lsp3 = { on_attach = on_attach },
	infoview = 
	{
		width = 30,
		height = 20,
	},
	mappings = true
}

vim.o.updatetime = 1


vim.cmd
[[
	autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc
	autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
]]



local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}


local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')


vim.cmd [[
  highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once

