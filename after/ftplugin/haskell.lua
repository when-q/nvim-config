vim.opt_local.expandtab = true
local ht = require('haskell-tools')
local buffer = vim.api.nvim_get_current_buf()
local def_opts = { noremap = true, silent = true, }
ht.start_or_attach {
  hls = {
    on_attach = function(_, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
    end,
    capatibilites = Coq.lsp_ensure_capabilities(),
  },
}

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Toggle a GHCi repl for the current package
local wk = require("which-key")
local wk_opts =
{
  mode = 'n',
  silent = true,
}
local haskell_which_key = {
  [','] = {
    c = {'<cmd>lua vim.lsp.codelens.run<cr>', "run Codelens", opts },
    r = {'<cmd>lua require(\'haskell-tools\').repl.toggle()<cr>', "Repl for current pkg", opts },
    f = {'<cmd>lua require(\'haskell-tools\').repl.toggle(vim.api.nvim_buf_get_name(0))<cr>', "Repl for current buffer", def_opts },
    q = {'<cmd>lua require(\'haskell-tools\').repl.quit()<cr>', "Quit Repl", opts },
    h = {'<cmd>lua require(\'haskell-tools\').hoogle.hoogle_signature()<cr>', "hoogle search signatures",opts },
    e = {'<cmd>lua require(\'haskell-tools\').lsp.buf_eval_all()<cr>', "eval all in buffer", opts },
  }
}

wk.register(haskell_which_key, wk_opts)
