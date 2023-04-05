M = {}
local wk = require("which-key")
local wk_opts =
{
  mode = 'n',
  silent = true,
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
      d = { '<cmd>TodoTelescope<cr>', "Todo in Telescope", { noremap = true } },


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
      r = { vim.lsp.buf.references, "Show References", bufopts },
      R = { "<cmd>TroubleToggle lsp_references<cr>", "Toggle References", bufopts }
    },
  }

  wk.register(lsp_keys, wk_opts)
end

function M.trouble_which_key()
  local trouble_keys = {
    ['<leader>q'] = {
      name = "+Trouble Actions",
      x = { '<cmd>TroubleToggle<cr>', "Trouble Toggle", },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Workspace", },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Document", },
      l = { "<cmd>TroubleToggle loclist<cr>", "Trouble Local" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" }
    }
  }
  wk.register(trouble_keys, wk_opts)
end


function M.undo_tscope_which_key()
  local undo_tscope_key = {
    ['<leader>u'] = {
      name = "+Undo Actions",
      u = { ':lua require("telescope").extensions.undo.undo()<cr>', "Undo List" }
    }
  }
  wk.register(undo_tscope_key)
end

function M.glance_which_key()
  local glance_key = {
    ['<leader>g'] = {
      name = "+Glance Actions",
      d = { '<cmd>Glance definitions<CR>', "Glance definitions" },
      r = { '<cmd>Glance references<CR>', "Glance references" },
      y = { '<cmd>Glance type_definitions<CR>', "Glance typedef" },
      m = { '<cmd>Glance implementations<CR>', "Glance implementations" },
    }
  }
  wk.register(glance_key)
end

function M.diffview_which_key()
  local diffview_key = {
    ['<leader>d'] = {
      name = "+Diffview Actions",
      o = { '<cmd>DiffviewOpen<CR>', "Open Diffview" },
      k = { '<cmd>DiffviewClose<CR>', "Close Diffview" },
      h = { '<cmd>DiffviewFileHistory<CR>', "Diffview History" },
    }
  }
  wk.register(diffview_key)
end

function M.terminal_which_key()
  local term_map = require("terminal.mappings")
  vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true, desc = "send operator" })
  vim.keymap.set("n", "<leader>to", term_map.toggle, {desc = "Toggle Term"})
  vim.keymap.set("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }), {desc = "Toggle enew"})
  vim.keymap.set("n", "<leader>tr", term_map.run, {desc = "erun"})
  vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }), {desc = "Run enew"})
  vim.keymap.set("n", "<leader>tk", term_map.kill, {desc = "Kill Term"})
  vim.keymap.set("n", "<leader>t]", term_map.cycle_next, {desc = "Next Term"})
  vim.keymap.set("n", "<leader>t[", term_map.cycle_prev, {desc = "Prev Term"})
  vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }), {desc = "Belowright vnew"})
  vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }), {desc = "botright vnew"})
  vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }), {desc = "belowright new"})
  vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }), {desc = "botright new"})
  vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }), {desc = "float"})
end

return M
