"if exists("current_compiler")
"  finish
"endif
let current_compiler = "phplint"
setlocal makeprg=php\ -lq\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l 
