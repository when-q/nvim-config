vim.cmd
[[
    au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"
    au BufWritePost *.lagda.md execute "normal! :CornelisLoad\<CR>"
    au BufWritePost *.lagda execute "normal! :CornelisLoad\<CR>"

	au BufRead,BufNewFile *.agda, *.lagda.md call AgdaFiletype()
	function! AgdaFiletype()
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
	endfunction

]]
