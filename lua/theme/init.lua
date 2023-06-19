vim.o.termguicolors = true
vim.o.background = ""

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
require 'nordic'.setup()
--vim.cmd[[colorscheme nordic]]
--vim.cmd [[colorscheme kanagawa-wave]]
--require("kanagawa").load("dragon")
--vim.cmd[[colorscheme everforest]]

--vim.g['spring_night_high_contrast'] = 1
vim.g['showtabline'] = 2
