" vim: set ft=vim:
"------------------------------------------------------------
" JavaScript Programming Specified Configure
"------------------------------------------------------------

autocmd! BufNewFile,BufRead *.part set filetype=html
autocmd! BufNewFile,BufRead *.ejs  set filetype=html

autocmd! FileType jade setlocal shiftwidth=2
autocmd! FileType jade setlocal softtabstop=2
autocmd! FileType jade setlocal tabstop=2
