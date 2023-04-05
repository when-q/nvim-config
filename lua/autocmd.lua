vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


vim.cmd [[
augroup spring_override
	autocmd!
	  autocmd Colorscheme spring-night hi LineNr ctermfg=231 ctermbg=231 guifg=#8d9eb2 guibg=#132132
	  autocmd Colorscheme spring-night hi SignColumn ctermfg=None ctermbg=None guifg=None guibg=None
augroup END
]]

vim.api.nvim_create_autocmd('TextYankPost',
  {
    group = vim.api.nvim_create_augroup('yank_highlight', {}),
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 400 }
    end,
  })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  {
    group = vim.api.nvim_create_augroup('mlir-highlight', {}),
    pattern = { '*.mlir', '*.xdsl' },
    callback = function()
      vim.cmd [[set ft=mlir]]
    end,
  })
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

-- Htop with terminal.nvim
local htop = require("terminal").terminal:new({
    layout = { open_cmd = "float" },
    cmd = { "htop" },
    autoclose = true,
})
vim.api.nvim_create_user_command("Htop", function()
    htop:toggle(nil, true)
end, { nargs = "?" })
vim.api.nvim_create_autocmd("TermOpen", {
    command = [[setlocal nonumber norelativenumber winhl=Normal:NormalFloat]]
})
