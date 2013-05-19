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

Bundle 'minibufexpl.vim'

" unite.vim
Bundle 'unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_time_format=''
let g:unite_source_file_mru_limit=50
nnoremap <silent> <F1> :<C-u>Unite buffer <CR>
nnoremap <silent> <F2> :<C-u>Unite file<CR>
nnoremap <silent> <F3> :<C-u>Unite file_mru<CR>
nnoremap <silent> <F4> :<C-u>Unite bookmark<CR>
nnoremap <silent> <Leader>y :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> <Leader>u :<C-u>Unite buffer file_mru bookmark file<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    imap <buffer> <ESC> <ESC>:q<CR>
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
Bundle 'fugitive.vim'

" surround.vim
Bundle 'surround.vim'

" quickrun.vim
Bundle 'quickrun.vim'

"The NERD Tree
Bundle 'The-NERD-tree'
Bundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <silent> <F11> :NERDTreeTabsToggle<CR>:vertical resize 50<CR>

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

" edit and apply .vimrc
nnoremap <silent> <leader>ve :e ~/.vimrc<CR>
nnoremap <silent> <leader>va :source ~/.vimrc<CR>

" turn off highlight
nnoremap <silent> <C-i> :nohl<CR><C-i>

" buffer motion
nnoremap <silent> <C-e> :e
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-x> :bdelete<CR>

" motion controll remap
inoremap <silent> <C-o> <END>
inoremap <silent> <C-a> <HOME>
nnoremap <silent> <C-h> ^
inoremap <silent> <C-h> <LEFT>
nnoremap <silent> <C-j> <C-d>
inoremap <silent> <C-j> <DOWN>
nnoremap <silent> <C-k> <C-u>
inoremap <silent> <C-k> <UP>
nnoremap <silent> <C-l> $
inoremap <silent> <C-l> <Right>

" shell
nnoremap <silent> <leader>s :shell<CR>

"------------------------------------------------------------
" autocmd settingsc
"
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s//  /ge
