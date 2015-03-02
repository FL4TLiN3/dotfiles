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

" powerline
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
set laststatus=2
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
let g:Powerline_symbols = 'fancy'
set noshowmode

" unite.vim
NeoBundle 'unite.vim'
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
" let s:file_rec_ignore_pattern = (unite#sources#file_rec#define()[0]['ignore_pattern']) . '\|node_modules'
" call unite#custom_source('file', 'ignore_pattern', s:file_rec_ignore_pattern)
function! s:unite_my_settings()
    map <buffer> <ESC> <ESC>:q<CR>
    imap <buffer> <C-o> <Plug>(unite_insert_leave):<C-u>call unite#mappings#do_action('above')<CR>
endfunction

" syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_save=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['javascript'],
  \ 'passive_filetypes': ['html', 'perl']
  \ }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'


" The NERD Tree
NeoBundle 'The-NERD-tree'
NeoBundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <silent> <F11> :NERDTreeTabsToggle<CR>:vertical resize 50<CR>

" vimfiler.vim
NeoBundle 'Shougo/vimfiler.vim'
:let g:vimfiler_as_default_explorer=1
:let g:vimfiler_safe_mode_by_default=0
nnoremap <silent> <F11> :VimFiler -buffer-name=explorer -split -winwidth=90 -toggle -no-quit<CR>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
    nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
    nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
endfunction
" call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
endfunction
" call unite#custom_action('file', 'my_vsplit', s:my_action)

" The NERD Commenter
NeoBundle 'The-NERD-Commenter'
let g:NERDCreateDefaultMappings=0
let g:NERDShutUp=1
let NERDSpaceDelims=1
nmap <silent> <leader>/ <Plug>NERDCommenterToggle
vmap <silent> <leader>/ <Plug>NERDCommenterToggle

" EasyMotion
NeoBundle 'EasyMotion'

" JavaScript
NeoBundle 'jiangmiao/simple-javascript-indenter'
let g:SimpleJsIndenter_BriefMode=1
let g:SimpleJsIndenter_CaseIndentLevel=-1

" jade
NeoBundle 'digitaltoad/vim-jade'

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

" Colorscheme
colorscheme xoria256

"------------------------------------------------------------
" imports
"
source ~/.dotfiles/.vimrc.motion
source ~/.dotfiles/.vimrc.git
source ~/.dotfiles/.vimrc.vimshell
source ~/.dotfiles/.vimrc.lang.perl
source ~/.dotfiles/.vimrc.lang.html
source ~/.dotfiles/.vimrc.lang.javascript

"------------------------------------------------------------
" autocmd settingsc
"
" autocmd BufWritePre * :%s/\s\+$//ge
" autocmd BufWritePre * :%s//  /ge
