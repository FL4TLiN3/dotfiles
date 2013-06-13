" vim: set ft=vim:
"------------------------------------------------------------
" Perl Programming Specified Configure
"------------------------------------------------------------

autocmd FileType perl setlocal noexpandtab
autocmd FileType perl setlocal nolist
autocmd FileType perl setlocal listchars=trail:-,extends:>,precedes:<

nnoremap <silent> <Leader>w :<C-u>call PerlSaveAndRestart()<CR>
function! PerlSaveAndRestart()
    wall
endfunction
