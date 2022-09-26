local map = vim.api.nvim_set_keymap


local function map_cornelis()
       map('n', '<leader>l', ':CornelisLoad<CR>', {noremap=true})
       map('n', '<leader>r', ':CornelisRefine<CR>', {noremap=true})
       map('n', '<leader>d', ':CornelisMakeCase<CR>', {noremap=true})
       map('n', '<leader>,', ':CornelisTypeContext<CR>', {noremap=true})
       map('<leader>.', ':CornelisTypeContextInfer<CR>', {noremap=true})
       map('<leader>n', ':CornelisSolve<CR>', {noremap=true})
       map('<leader>a', ':CornelisAuto<CR>', {noremap=true})
       map('gd', ':CornelisGoToDefinition<CR>', {noremap=true})
       map('gd', ':CornelisGoToDefinition<CR>', {noremap=true})
       map('[/', ':CornelisPrevGoal<CR>', {noremap=true})
       map(']/', ':CornelisNextGoal<CR>', {noremap=true})
end

local function agda_tab ()
	vim.api.nvim_command("setlocal expandtab shiftwidth=2 tabstop=2")
end

local function agda_resize()
	if vim.bo.buftype == 'nofile' then
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
