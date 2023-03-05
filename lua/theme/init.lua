vim.o.termguicolors = true

vim.o.background = ''

require("theme.line")
require 'kanagawa'.setup(
  {
    overrides = function(colors)
      return {
        WinSeparator = {
          fg = colors.palette.oldWhite,
          bg = "NONE"
        }
      }
    end
  })

vim.api.nvim_command [[colorscheme kanagawa-wave]]
vim.g['showtabline'] = 2
