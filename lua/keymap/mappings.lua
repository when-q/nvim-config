local map = vim.api.nvim_set_keymap
local which_key = require("keymap.which_key")

vim.g.mapleader = ' '
vim.g.maplocalleader =","

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

-- Leap.nvim Mapping
vim.keymap.set('n', 'gs', '<Plug>(leap-forward-to)', {noremap=true})
vim.keymap.set('n', 'gS', '<Plug>(leap-backward-to)')
vim.keymap.set({'x', 'o'}, 'gx', '<Plug>(leap-forward-till)', {noremap=true})
vim.keymap.set({'n', 'x', 'o'}, 'gX','<Plug>(leap-backward-till)', {noremap=true})
vim.keymap.set({'n', 'x','o'},'gc', '<Plug>(leap-cross-window)', {noremap=true})
-- misc
vim.keymap.set('n', ',v', '<c-v>')
-- Which-key mapping

-- Telescope mapping
which_key.telescope_which_key()
