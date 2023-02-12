local map = vim.api.nvim_set_keymap
local which_key = require("keymap.which_key")

vim.g.mapleader = ' '
map('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true })
map('n', '  ', ':noh<CR>', { noremap = true })
-- Tmux Navigator Mapping
vim.g['tmux_navigator_no_mappings'] = 1
map('n', "<c-h>", ":TmuxNavigateLeft<cr>", { noremap = true })
map('n', "<c-l>", ":TmuxNavigateRight<cr>", { noremap = true })
map('n', "<c-j>", ":TmuxNavigateDown<cr>", { noremap = true })
map('n', "<c-k>", ":TmuxNavigateUp<cr>", { noremap = true })

-- leap.nvim mapping
vim.keymap.set('n', 'gs', '<Plug>(leap-forward-to)', { noremap = true })
vim.keymap.set('n', 'gS', '<Plug>(leap-backward-to)')
vim.keymap.set({ 'x', 'o' }, 'gx', '<Plug>(leap-forward-till)', { noremap = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'gX', '<Plug>(leap-backward-till)', { noremap = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'gc', '<Plug>(leap-cross-window)', { noremap = true })

-- mind.nvim mapping
-- nmisc
vim.keymap.set('n', ',v', '<c-v>')
-- Which-key mapping
which_key.telescope_which_key()
which_key.trouble_which_key()
which_key.undo_tscope_which_key()
which_key.glance_which_key()
which_key.tab_which_key()
