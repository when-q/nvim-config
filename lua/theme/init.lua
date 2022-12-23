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
-- vim.api.nvim_command [[colorscheme kanagawa]]
vim.g['spring_night_high_contrast'] = 1
vim.cmd[[
augroup spring_override
	autocmd!
	  autocmd Colorscheme spring-night hi LineNr ctermfg=235 ctermbg=None guifg=None guibg=None
	  autocmd Colorscheme spring-night hi SignColumn ctermfg=None ctermbg=None guifg=None guibg=None
augroup END
]]

vim.api.nvim_command [[colorscheme spring-night]]

vim.g['showtabline'] = 2
