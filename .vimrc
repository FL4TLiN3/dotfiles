set nocompatible

"------------------------------------------------------------
" Vundle
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Colorscheme
Bundle 'xoria256.vim'
colorscheme xoria256

" Vim Powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

" Bundle 'minibufexpl.vim'

" unite.vim
Bundle 'unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_time_format=''
let g:unite_source_file_mru_limit=50
nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer <CR>
nnoremap <silent> <Leader>m :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>B :<C-u>Unite bookmark<CR>
nnoremap <silent> <Leader>y :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> <Leader>u :<C-u>Unite buffer file_mru bookmark file<CR>
autocmd FileType unite call s:unite_my_settings()
let s:file_rec_ignore_pattern = (unite#sources#file_rec#define()[0]['ignore_pattern']) . '\|node_modules'
call unite#custom_source('file', 'ignore_pattern', s:file_rec_ignore_pattern)
function! s:unite_my_settings()
    map <buffer> <ESC> <ESC>:q<CR>
    nmap <buffer> <C-c> :q<CR>
    imap <buffer> <C-o> <Plug>(unite_insert_leave):<C-u>call unite#mappings#do_action('above')<CR>
endfunction

" neocomplcache & neosnippet (detail setting describe later)
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_save=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checker='jshint'
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': ['ruby', 'javascript'],
    \ 'passive_filetypes': []
    \ }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" fugitive.vim
Bundle 'gregsexton/gitv'
Bundle 'fugitive.vim'
nnoremap <silent> <Leader>g :<C-u>Gitv <CR>
nnoremap <silent> <Leader>G :<C-u>Gitv! <CR>
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
    nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
    nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

function! s:gitv_get_current_hash()
    return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
    if &filetype ==# 'git'
        setlocal foldenable!
    endif
endfunction

" surround.vim
Bundle 'surround.vim'

" quickrun.vim
Bundle 'quickrun.vim'

"The NERD Tree
" Bundle 'The-NERD-tree'
" Bundle 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_console_startup=1
" nnoremap <silent> <F11> :NERDTreeTabsToggle<CR>:vertical resize 50<CR>

" The NERD Commenter
Bundle 'The-NERD-Commenter'
let g:NERDCreateDefaultMappings=0
let g:NERDShutUp=1
let NERDSpaceDelims=1
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle

" EasyMotion
Bundle 'EasyMotion'

" JavaScript
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jiangmiao/simple-javascript-indenter'
let g:SimpleJsIndenter_BriefMode=1
let g:SimpleJsIndenter_CaseIndentLevel=-1
Bundle 'teramako/jscomplete-vim'
:let g:jscomplete_use=['dom', 'es6th']

" jade
Bundle 'digitaltoad/vim-jade'

" markdown
Bundle 'Markdown'

"------------------------------------------------------------
" General options
"
filetype indent plugin on
syntax on
set history=10000
set cwh=100
set shortmess+=I
set number
set title
set showmode
set hidden
set wildmenu
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set nostartofline
set backspace=indent,eol,start
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set ruler
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set cmdheight=2
set confirm
set visualbell
set t_vb=
set mouse=a
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<leader>t
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
augroup vimrc
    autocmd! FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
set expandtab
set clipboard=unnamed
set autoread
set nofoldenable
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]

set nobackup
set noswapfile
" set backup
" set backupdir=~/.vim/vim_backup
" set backupskip=/tmp/*,/private/tmp/*
" set swapfile
" set directory=~/.vim/vim_swap

" edit and apply .vimrc
nnoremap <silent> <leader>ve :e ~/.vimrc<CR>
nnoremap <silent> <leader>va :source ~/.vimrc<CR>

" turn off highlight
nnoremap <silent> <C-i> :nohl<CR><C-i>

" shell
nnoremap <silent> <leader>s :shell<CR>

"------------------------------------------------------------
" imports
"
source ~/.dotfiles/.vimrc.motion

"------------------------------------------------------------
" autocmd settingsc
"
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s//  /ge
