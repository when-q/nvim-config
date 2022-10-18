vim.cmd[[
fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
		\ nobackup
		\ nonumber
		\ laststatus=1
		\ fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:⠀
		\ noshowmode
		\ noruler
        \ nolist
		\ t_ve=
        \ norelativenumber

    " Now we can just write to the buffer, whatever you want.
	let head = [
	  \ 'Press SPC f o to show recently opened files.',
      \ '        o',
      \ '         o   ^__^',
      \ '          o  (oo)\_______',
      \ '             (__)\       )\/\',
      \ '                 ||----w |',
      \ '                 ||     ||'
      \ ]
	let length = 0
	for str in head
		if strdisplaywidth(str) > length
			let length = strdisplaywidth(str)
		endif
	endfor

    call append('$', "")
	let pad = "⠀"
	let i = 0

	let offset = 0
	let max_widths = &columns - length - offset
	for line in head
		while  i < (max_widths / 2  - 1)
			let pad  = l:pad . "⠀"
			let i += 1
		endwhile

        call append('$', l:pad . l:line)
	endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified
    " When we go to insert mode start a new buffer, and start insert
	" need to add your own mapping if you have a shortcut for opening a file
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> O  :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> I :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> a :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> <C-n> :enew <bar>  NvimTreeToggle<CR>
endfun

fun! s:disable_statusline(bn)
   if a:bn == bufname('-')
       set laststatus=1
   else
       set laststatus=3
   endif
endfun



" Run after "doing all the startup stuff"

autocmd VimEnter * call Start()
autocmd BufEnter * call s:disable_statusline('buffer name')

]]
