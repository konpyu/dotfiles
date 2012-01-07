"-------------------------------------------------------------------------------------------------
" Basic Settings
"-------------------------------------------------------------------------------------------------

" Use Vim Setting, rather than vi settings(much better)
set nocompatible

" We Love utf8
set encoding=utf-8
set termencoding=utf-8

" Don't beep any more!!!
set visualbell
set noerrorbells

" what wilememu??
set wildmenu
set wildmode=list:full

set history=1000

" easy install of rumtime
" include all plugins .vim/bundle
call pathogen#runtime_append_all_bundles()

set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set backspace=indent

set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set number
set autoread                               " auto read when file is changed from outside
set ruler
set showmode
set title
set backspace=eol,start
set noswapfile
set nowrap
set paste                                  " ペースト時にインデントはいらん
set copyindent
set tags=tags;
set clipboard=unnamed
set ignorecase
set list
set listchars=tab:^\ ,trail:~
set ambiwidth=double
set display+=lastline
set hlsearch
set mouse=a                                " enable mouse scroll
set scrolloff=4
set clipboard+=autoselect
set clipboard+=unnamed
let loaded_matchparen = 1

"-------------------------------------------------------------------------------------------------
" vim-smartchr Settings
"-------------------------------------------------------------------------------------------------
inoremap <expr> = smartchr#loop(' = ', '=' , ' == ')

"-------------------------------------------------------------------------------------------------
" NERDTree Settings
"-------------------------------------------------------------------------------------------------
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
command! Tr NERDTree

nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

"-------------------------------------------------------------------------------------------------
" Filetype Setting
"-------------------------------------------------------------------------------------------------
autocmd FileType ruby set shiftwidth=2 tabstop=2
autocmd FileType perl :compiler perl
autocmd Filetype javascript :set dictionary=$HOME/.vim/dict/ti.dict

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"inoremap <Esc> <Esc>gg`]

if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

" erase highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

syntax on
colorscheme wombat256mod

filetype on
filetype indent on
filetype plugin on

autocmd FileType ruby set shiftwidth=2 tabstop=2
autocmd FileType perl :compiler perl
autocmd FileType html :set  encoding=sjis
autocmd FileType perl :set  encoding=euc-jp
autocmd FileType sql  :set  encoding=sjis
autocmd FileType sql  :set  termencoding=euc-jp
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"-------------------------------------------------------------------------------------------------
" character type
"-------------------------------------------------------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif

if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif

let g:titanium_android_sdk_path='~/android-sdk-mac_x86'

"-------------------------------------------------------------------------------------------------
" commentout area that select in visual mode
" visualize >> press ,#
"-------------------------------------------------------------------------------------------------
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>
