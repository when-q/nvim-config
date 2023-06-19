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
vim.keymap.set('n', 'gs',
  function()
    local current_window = vim.fn.win_getid()
    require('leap').leap { target_windows = { current_window } }
  end,
  { noremap = true, desc = "bidirectional leap"}
)
vim.keymap.set({ 'x', 'o' }, 'gx', '<Plug>(leap-forward-till)', { noremap = true, desc = "leap forward visual" })
vim.keymap.set({ 'n', 'x', 'o' }, 'gX', '<Plug>(leap-backward-till)', { noremap = true, desc = "leap backward visual" })
vim.keymap.set({ 'n', 'x', 'o' }, 'gc', '<Plug>(leap-cross-window)', { noremap = true, desc = "leap cross window" })

-- orgmode.nvim mapping
local default_note_dir = os.getenv('HOME') .. '$HOME/.config/org/note/'
vim.keymap.set('n', '<leader>od', ':edit ' .. default_note_dir .. 'default.org<cr>',
  { noremap = true, desc = "edit default org-note" })
vim.keymap.set('n', '<leader>of', ':edit ' .. default_note_dir .. 'agenda/<cr>',
  { noremap = true, desc = "edit default org-note" })
vim.keymap.set('n', '<leader>ow', ':edit project.org<cr>', { noremap = true, desc = "edit workfolder org-note" })
vim.keymap.set('n', ",\"", ":Telescope registers<cr>", { noremap = true, desc = "Telescope reg & paste" })
-- nmisc
vim.keymap.set('n', ',v', '<c-v>')
-- Which-key mapping
which_key.telescope_which_key()
which_key.trouble_which_key()
which_key.glance_which_key()
which_key.diffview_which_key()
