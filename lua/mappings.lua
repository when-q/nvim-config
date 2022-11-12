local map = vim.api.nvim_set_keymap
-- Telescope Mapping
map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', {noremap = true})
map('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {noremap = true})
map('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {noremap = true})
map('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})
map('n', '<Leader>fo', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', {noremap = true})
-- NvimTree Mapping
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap=true})
map('n', '<Leader> ', ':noh<CR>', {noremap=true})
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

