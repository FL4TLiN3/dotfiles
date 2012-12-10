set nocompatible
colorscheme xoria256

"------------------------------------------------------------
" Vundle
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 必須bundle
Bundle 'gmarik/vundle'

" 重要bundle
Bundle 'railscasts'
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'mru.vim'
let MRU_Auto_Close=0
let MRU_Max_Entries=100000
let MRU_Exclude_Files="^/tmp/.*\|^/var/tmp/.*"
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
let NERDShutUp = 1
Bundle 'EasyMotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
let g:fuf_keyOpen = '<Tab>'
let g:fuf_keyOpenTabpage = '<CR>'
nnoremap bf :<C-u>FufFile **/<CR>
nnoremap br :<C-u>FufMruFile<CR>
Bundle 'AutoClose'

"------------------------------------------------------------
" General options
"
filetype indent plugin on
syntax on
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
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed
set autoread
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]
imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>
nnoremap <C-L> :nohl<CR><C-L>

set backup
set backupdir=~/.vim/vim_backup
set backupskip=/tmp/*,/private/tmp/*
set swapfile
set directory=~/.vim/vim_swap

augroup BufferAu
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END
