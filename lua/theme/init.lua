vim.o.termguicolors = true

vim.o.background = 'dark'
require("theme.line")
require("catppuccin").setup({ flavour = "macchiato" -- mocha, macchiato, frappe, latte
})
--vim.api.nvim_command [[colorscheme kanagawa]]
vim.api.nvim_command [[colorscheme catppuccin]]
vim.g['showtabline'] = 2
