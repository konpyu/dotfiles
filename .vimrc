"-------------------------------------------------------------------------------------------------
" .vimrc setting
" @konpyu
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
set paste                                  " dont indent when paste text
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
" Vundle
"-------------------------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'molokai'

"-------------------------------------------------------------------------------------------------
" mappings
"-------------------------------------------------------------------------------------------------

nmap j gj
nmap k gk
vmap j gj
vmap k gk

nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <C-p> :bp<CR>
nmap <C-n> :bn<CR>
nmap L $
nmap H 0

"-------------------------------------------------------------------------------------------------
" NERDTree Settings
"-------------------------------------------------------------------------------------------------
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
command! Tr NERDTree

"-------------------------------------------------------------------------------------------------
" Filetype Setting
"-------------------------------------------------------------------------------------------------
filetype on
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
colorscheme molokai

"autocmd FileType html :set  encoding=sjis
"autocmd FileType perl :set  encoding=euc-jp
"autocmd FileType sql  :set  encoding=sjis
"autocmd FileType sql  :set  termencoding=euc-jp
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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
" press ,# ,/
" to clear , press ,c
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

"--------------------------------------------------------------------------
" Unite.vim
"--------------------------------------------------------------------------
"let g:unite_enable_start_insert=1
command! UU Unite buffer file_mru
command! UM Unite file_mru
command! UB Unite buffer
command! UF Unite -buffer-name=register register

au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" ======== End Of File ========
