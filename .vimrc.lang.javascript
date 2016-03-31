" vim: set ft=vim:
"------------------------------------------------------------
" JavaScript Programming Specified Configure
"------------------------------------------------------------

autocmd! BufNewFile,BufRead *.part set filetype=html
autocmd! BufNewFile,BufRead *.ejs  set filetype=html
autocmd! BufNewFile,BufRead *.hbs  set filetype=html

autocmd! FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd! FileType javascript.jsx setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd! FileType ejs setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd! FileType hbs setlocal shiftwidth=2 softtabstop=2 tabstop=2
