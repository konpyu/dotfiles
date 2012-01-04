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
" NERDTree Settings
"-------------------------------------------------------------------------------------------------
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
command! Tr NERDTree

"-------------------------------------------------------------------------------------------------
" Filetype Setting
"-------------------------------------------------------------------------------------------------
autocmd FileType ruby set shiftwidth=2 tabstop=2

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"inoremap <Esc> <Esc>gg`]

if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

" erase highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

"色分け
syntax on
colorscheme wombat256mod

filetype on
filetype indent on
filetype plugin on

autocmd Filetype javascript :set dictionary=$HOME/.vim/dict/ti.dict
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

"-------------------------------------------------------------------------------------------------
" neocomplcacheの設定
"-------------------------------------------------------------------------------------------------
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_dictionary_filetype_lists = { 'default' : '','javascript' : $HOME.'/.vim/dict/ti.dict', }
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"inoremap <expr><CR>   pumvisible() ? neocomplcache#close_popup() : "<CR>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
