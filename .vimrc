"------------------------------------------------------------
" NeoBundle
"

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

:let g:neobundle#types#git#default_protocol='https'

" Colorscheme
NeoBundle 'xoria256.vim'

" Unite
" sudo.vim
NeoBundle 'sudo.vim'

" unite.vim
NeoBundle 'unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" syntastic
" NeoBundle 'scrooloose/syntastic'
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_save=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=6
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_mode_map = {
  " \ 'mode': 'active',
  " \ 'active_filetypes': ['javascript'],
  " \ 'passive_filetypes': ['html', 'perl']
  " \ }
" let g:syntastic_enable_signs=1
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'

" The NERD Commenter
NeoBundle 'The-NERD-Commenter'
let g:NERDCreateDefaultMappings=0
let g:NERDShutUp=1
let NERDSpaceDelims=1
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle

" JavaScript
NeoBundle 'othree/yajs.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
let g:jsx_ext_required=0

" TypeScript
NeoBundle 'HerringtonDarkholme/yats.vim'

" Elixir
NeoBundle "elixir-lang/vim-elixir"

" markdown
NeoBundle 'Markdown'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"------------------------------------------------------------
" General options
"
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
set virtualedit=block
set ignorecase
set smartcase
set nostartofline
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac
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
set undodir=~/.vim/undo

" edit and apply .vimrc
nnoremap <silent> <leader>ve :e ~/.vimrc<CR>
nnoremap <silent> <leader>va :source ~/.vimrc<CR>

" turn off highlight
nnoremap <silent> <C-i> :nohl<CR><C-i>

" shell
nnoremap <silent> <leader>s :shell<CR>

" Remap command mode key
nnoremap ; :
nnoremap : ;

" Colorscheme
colorscheme xoria256

"------------------------------------------------------------
" imports
"
source ~/.dotfiles/.vimrc.motion
source ~/.dotfiles/.vimrc.git
source ~/.dotfiles/.vimrc.vimshell
source ~/.dotfiles/.vimrc.lang.perl
source ~/.dotfiles/.vimrc.lang.ruby
source ~/.dotfiles/.vimrc.lang.html
source ~/.dotfiles/.vimrc.lang.javascript
source ~/.dotfiles/.vimrc.lang.typescript

"------------------------------------------------------------
" Unite Settings
"

let g:unite_enable_start_insert=1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 1000

" Install highway before using unite grep
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--nogroup'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap [unite] <Nop>
nmap <Space> [unite]

" unite.vim keymap
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep: -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]G :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>


