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

" unite.vim
Bundle 'unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_time_format=''
let g:unite_source_file_mru_limit=50
nnoremap <silent> <F1> :<C-u>Unite buffer <CR>
nnoremap <silent> <F2> :<C-u>Unite file<CR>
nnoremap <silent> <F3> :<C-u>Unite file_mru<CR>
nnoremap <silent> <F4> :<C-u>Unite bookmark<CR>
nnoremap <silent> <F11> :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> <Leader>u :<C-u>Unite buffer file_mru bookmark file<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <buffer> <ESC> <ESC>:q<CR>
  imap <buffer> <C-o> <Plug>(unite_insert_leave):<C-u>call unite#mappings#do_action('above')<CR>
endfunction

" Vim Powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

" fugitive.vim
Bundle 'fugitive.vim'

" surround.vim
Bundle 'surround.vim'

" The NERD Commenter
Bundle 'The-NERD-Commenter'
let g:NERDCreateDefaultMappings=0
let g:NERDShutUp=1
let NERDSpaceDelims=1
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle

" EasyMotion
Bundle 'EasyMotion'

" Javascript
Bundle 'jelera/vim-javascript-syntax'

" jade
Bundle 'digitaltoad/vim-jade'

" markdown
Bundle 'quickrun.vim'
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
set tabstop<
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed
set autoread
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]
imap <C-o> <END>
imap <C-a> <HOME>
imap <C-h> <LEFT>
imap <C-j> <DOWN>
imap <C-k> <UP>
imap <C-l> <Right>

set backup
set backupdir=~/.vim/vim_backup
set backupskip=/tmp/*,/private/tmp/*
set swapfile
set directory=~/.vim/vim_swap

" edit and apply .vimrc
nnoremap <leader>ve :e ~/.vimrc<CR>
nnoremap <leader>va :source ~/.vimrc<CR>

" turn off highlight
nnoremap <C-i> :nohl<CR><C-i>

" buffer motion
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

" motion controll remap
noremap <C-h> ^
noremap <C-l> $
noremap <C-j> <C-d>
noremap <C-k> <C-u>

" shell
nnoremap <leader>s :shell<CR>

