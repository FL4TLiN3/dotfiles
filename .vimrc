set nocompatible

"------------------------------------------------------------
" Vundle
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'mru.vim'
let g:MRU_File=$HOME."/.vim/vim_mru_files"
let g:MRU_Auto_Close=0
let g:MRU_Max_Entries=100000
let g:MRU_Exclude_Files="^/tmp/.*\|^/var/tmp/.*"
Bundle 'The-NERD-tree'
nmap <F2> :NERDTreeToggle<CR>
Bundle 'The-NERD-Commenter'
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
let g:NERDShutUp = 1
Bundle 'EasyMotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
let g:fuf_dataDir=$HOME."/.vim/vim-fuf-data"
let g:fuf_keyOpenTabpage = '<CR>'
let g:fuf_keyOpen = '<Tab>'
nnoremap bf :<C-u>FufFile **/<CR>
nnoremap br :<C-u>FufMruFile<CR>

" Javascript
Bundle 'jelera/vim-javascript-syntax'

" Colorscheme
Bundle 'xoria256.vim'

"------------------------------------------------------------
" General options
"
filetype indent plugin on
syntax on
colorscheme xoria256
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
set pastetoggle=<F11>
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

nnoremap <C-i> :nohl<CR><C-i>

" tab controll remap
nmap <C-n> :tabn<CR>
nmap <C-p> :tabr<CR>
nmap <C-x> :tabc<CR>

" motion controll remap
nmap <C-h> ^
nmap <C-l> $
nmap <C-j> <C-d>
nmap <C-k> <C-u>
