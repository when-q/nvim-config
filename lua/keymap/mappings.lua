local map = vim.api.nvim_set_keymap
local which_key = require("keymap.which_key")

vim.g.mapleader = ' '
map('n', '<c-n>', ':NvimTreeToggle<CR>', {noremap=true})
map('n', '  ', ':noh<CR>', {noremap=true})
map('o', 'nc', '<cmd>normal! f{vi{<cr>', {noremap=true})
map('o', 'nr', '<cmd>normal! f(vi(<cr>', {noremap=true})
-- Tmux Navigator Mapping
vim.g['tmux_navigator_no_mappings'] = 1
map('n', "<c-h>", ":TmuxNavigateLeft<cr>", {noremap=true})
map('n', "<c-l>", ":TmuxNavigateRight<cr>", {noremap=true})
map('n', "<c-j>", ":TmuxNavigateDown<cr>", {noremap=true})
map('n', "<c-k>", ":TmuxNavigateUp<cr>", {noremap=true})

-- leap.nvim mapping
vim.keymap.set('n', 'gs', '<Plug>(leap-forward-to)', {noremap=true})
vim.keymap.set('n', 'gS', '<Plug>(leap-backward-to)')
vim.keymap.set({'x', 'o'}, 'gx', '<Plug>(leap-forward-till)', {noremap=true})
vim.keymap.set({'n', 'x', 'o'}, 'gX','<Plug>(leap-backward-till)', {noremap=true})
vim.keymap.set({'n', 'x','o'},'gc', '<Plug>(leap-cross-window)', {noremap=true})

-- mind.nvim mapping
local normal = {
      ["<cr>"] = "open_data",
      ["<s-cr>"] = "open_data_index",
      ["<tab>"] = "toggle_node",
      ["<s-tab>"] = "toggle_node",
      ["/"] = "select_path",
      ["$"] = "change_icon_menu",
      c = "add_inside_end_index",
      I = "add_inside_start",
      i = "add_inside_end",
      l = "copy_node_link",
      L = "copy_node_link_index",
      d = "delete",
      D = "delete_file",
      O = "add_above",
      o = "add_below",
      q = "quit",
      r = "rename",
      R = "change_icon",
      u = "make_url",
      x = "select",
    }

local selection = {
      ["<cr>"] = "open_data",
      ["<s-tab>"] = "toggle_node",
      ["/"] = "select_path",
      I = "move_inside_start",
      i = "move_inside_end",
      O = "move_above",
      o = "move_below",
      q = "quit",
      x = "select",
    }
-- misc
vim.keymap.set('n', ',v', '<c-v>')
-- Which-key mapping

-- Telescope mapping
which_key.telescope_which_key()

-- Trouble mapping
which_key.trouble_which_key()
which_key.undo_tscope_which_key()

