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
let g:Powerline_symbols = 'fancy'

Bundle 'fugitive.vim'
Bundle 'surround.vim'

" mru.vim
Bundle 'mru.vim'
let g:MRU_File=$HOME."/.vim/vim_mru_files"
let g:MRU_Auto_Close=0
let g:MRU_Max_Entries=100000
let g:MRU_Exclude_Files="^/tmp/.*\|^/var/tmp/.*"

" The NERD Tree
Bundle 'The-NERD-tree'
nmap <F2> :NERDTreeToggle<CR>

" The NERD Commenter
Bundle 'The-NERD-Commenter'
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
let g:NERDShutUp = 1

Bundle 'EasyMotion'

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
let g:fuf_dataDir=$HOME."/.vim/vim-fuf-data"
let g:fuf_keyOpenTabpage = '<CR>'
let g:fuf_keyOpen = '<Tab>'
nnoremap bf :<C-u>FufFile **/<CR>
nnoremap br :<C-u>FufMruFile<CR>

" Javascript
Bundle 'jelera/vim-javascript-syntax'

" markdown
Bundle 'quickrun.vim'
Bundle 'Markdown'

"------------------------------------------------------------
" General options
"
filetype indent plugin on
syntax on
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
set tabline=%!TabLine()
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

" turn off highlight
nnoremap <C-i> :nohl<CR><C-i>

" tab controll remap
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabr<CR>
nnoremap <C-x> :tabc<CR>

" motion controll remap
noremap <C-h> ^
noremap <C-l> $
noremap <C-j> <C-d>
noremap <C-k> <C-u>


function! TabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{TabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XClose'
  endif

  return s
endfunction

let g:use_Powerline_dividers = 1

function! TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let altbuf = bufname(buflist[winnr - 1])

    " $HOME を消す
    let altbuf = substitute(altbuf, expand('$HOME/'), '', '')

    " カレントタブ以外はパスを短くする
    if tabpagenr() != a:n
        let altbuf = substitute(altbuf, '^.*/', '', '')
        let altbuf = substitute(altbuf, '^.\zs.*\ze\.[^.]\+$', '', '')
    endif

    " vim-powerline のグリフを使う
    if g:use_Powerline_dividers
        let dividers = g:Pl#Parser#Symbols[g:Powerline_symbols].dividers
        let right_div = nr2char(get(dividers[1], 0, 124))
        let altbuf = altbuf.' '.right_div
    else
        let altbuf = '|' . altbuf . '|'
    endif

    " タブ番号を付加
    let altbuf = a:n . ':' . altbuf

    return altbuf
endfunction
