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
vim.o.background = "dark"
require "nordic".setup {
  bright_border = true,
  override = {
    WinSeparator = { fg = "#C8C093", bg = "NONE" }, --oldwhite, bg
  },
  swap_backgrounds = false,
}

require "nordic".load()
vim.g['showtabline'] = 2
