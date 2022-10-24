local map = vim.api.nvim_set_keymap

map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', {noremap = true})
map('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {noremap = true})
map('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {noremap = true})
map('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})
map('n', '<Leader>fo', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', {noremap = true})
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap=true})
map('n', '<Leader> ', ':noh<CR>', {noremap=true})
map('o', 'nc', '<cmd>normal! f{vi{<cr>', {noremap=true})
map('o', 'nr', '<cmd>normal! f(vi(<cr>', {noremap=true})

vim.g['tmux_navigator_no_mappings'] = 1
map('n', "<c-h>", ":TmuxNavigateLeft<cr>", {noremap=true})
map('n', "<c-l>", ":TmuxNavigateRight<cr>", {noremap=true})
map('n', "<c-j>", ":TmuxNavigateDown<cr>", {noremap=true})
map('n', "<c-k>", ":TmuxNavigateUp<cr>", {noremap=true})



vim.keymap.set('n', 'gs', '<Plug>(leap-forward-to)', {noremap=true})
vim.keymap.set('n', 'gS', '<Plug>(leap-backword-to)', {noremap=true})
vim.keymap.set({'x', 'o'}, 'gx', '<Plug>(leap-forward-till)', {noremap=true})
vim.keymap.set({'n', 'x', 'o'}, 'gX','<Plug>(leap-backward-till)', {noremap=true})
vim.keymap.set({'n', 'x', 'o'}, 'gX','<Plug>(leap-backward-till)', {noremap=true})
vim.keymap.set({'n','x','o'},'ggs', '<Plug>(leap-cross-window)', {noremap=true})

