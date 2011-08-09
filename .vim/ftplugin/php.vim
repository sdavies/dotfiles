compiler phplint
fun! OpenPhpFunction (keyword)
	let proc_keyword = substitute(a:keyword , '_', '-', 'g')
	exe 'split'
	exe 'enew'
	exe "set buftype=nofile"
	exe 'silent r!lynx -dump -nolist http://www.php.net/manual/en/print/function.'.proc_keyword.'.php'
	exe 'norm gg'
	exe 'call search ("' . a:keyword .'")'
	exe 'norm dgg'
	exe 'call search("User Contributed Notes")'
	exe 'norm dGgg'
endfun
map K :call OpenPhpFunction('<c-r><c-w>')<CR>
