local map = vim.api.nvim_set_keymap


local function map_cornelis()
	vim.cmd[[
		nnoremap <buffer> <leader>l :CornelisLoad<CR>
		nnoremap <buffer> <leader>r :CornelisRefine<CR>
		nnoremap <buffer> <leader>d :CornelisMakeCase<CR>
		nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
		nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
		nnoremap <buffer> <leader>n :CornelisSolve<CR>
		nnoremap <buffer> <leader>a :CornelisAuto<CR>
		nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
		nnoremap <buffer> [/        :CornelisPrevGoal<CR>
		nnoremap <buffer> ]/        :CornelisNextGoal<CR>
	]]end

local function agda_tab ()
	vim.api.nvim_command("setlocal expandtab shiftwidth=2 tabstop=2")
end

local function agda_resize()
	local win_type = vim.fn.win_gettype()
	if (vim.bo.buftype == 'nofile') and (win_type ~= 'popup') then
		vim.api.nvim_command('vertical resize 30')
	end
end

local function agda_setup()
	agda_tab()
	map_cornelis()
end

local agda_config = vim.api.nvim_create_augroup("agda_config", {clear=true})

vim.api.nvim_create_autocmd("FileType",
{
	pattern = "lagda.md",
	command = "set filetype=agda.markdown",
  group = agda_config
})

vim.api.nvim_create_autocmd(
{"FileType"},
{
	desc = "agda keymaps and indentation with correct filetype setup",
	group = agda_config,
	pattern = {"agda","agda.markdown"},
	callback = agda_setup
})

vim.api.nvim_create_autocmd(
{"BufEnter"},
{
	desc = "infowindow resizing",
	group = agda_config,
	pattern ="*",
	callback = agda_resize
})
