vim.o.termguicolors = true

vim.o.background = 'dark'
local line = require("theme.line")
local default_colors = line.colors
local function set_fg()
  local fg = default_colors.sumiInk4
  if (vim.o.background == 'dark') then
    fg = default_colors.oldWhite
  end
  return fg
end

local overrides = 
{
  WinSeparator =
  {
    fg = set_fg(),
    bg = "NONE"
  },
}

require 'kanagawa'.setup({ overrides = overrides })
vim.api.nvim_command [[colorscheme kanagawa]]
vim.g['showtabline'] = 2
