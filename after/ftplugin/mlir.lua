vim.cmd [[
  " Vim filetype plugin file
  " Language: MLIR Assembly
  " Maintainer: The MLIR team

  if exists("b:did_ftplugin")
    finish
  endif
  let b:did_ftplugin = 1

  setlocal comments+=://
]]

vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
