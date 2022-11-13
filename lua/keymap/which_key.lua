local M = {}
local wk = require("which-key")
local wk_opts =
{
  mode = 'n',
}

-- Telescope Mapping
function M.telescope_which_key()
  local telescope_which_key =
  {
    ['<leader>f'] = {
      name = "+Telescope", -- optional group name
      f = { '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', "Find File", { noremap = true } },
      g = { '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', "Grep content", { noremap = true } },
      b = { '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', "Find Buffer", { noremap = true } },
      h = { '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', "Find Help", { noremap = true } },
      o = { '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', "Search Old File", { noremap = true } },
    },
  }
  wk.register(telescope_which_key, wk_opts)
end

function M.lsp_which_key(bufopts, opts)
  local lsp_keys =
  {
    ['\\'] = {
      name = "+ Language Protocal Server Action", -- optional group name
      D = { vim.lsp.buf.type_definition, "Jumps to type definition", bufopts },
      rn = { vim.lsp.buf.rename, "Rename Variable", bufopts },
      ca = { vim.lsp.buf.code_action, "Code Action", bufopts },
      q = { vim.diagnostic.setloclist, "Local Diagnostic List", opts },
      f = { function() vim.lsp.buf.format { async = true } end, "format code", bufopts }
    },
    ["g"] = {
      name = "+ Language Protocal Server Action", -- optional group name
      D = { vim.lsp.buf.declaration, "Goto Declaration", bufopts },
      d = { vim.lsp.buf.definition, "Goto Definitions", bufopts },
      i = { vim.lsp.buf.implementation, "Show Implementations", bufopts },
      K = { vim.diagnostic.open_float, "Diagnostic of Current Line", bufopts },
      r = { vim.lsp.buf.references, "Show References", bufopts }
    },
  }

  wk.register(lsp_keys, wk_opts)
end

return M
