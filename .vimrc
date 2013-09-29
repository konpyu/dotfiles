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

inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

colorscheme molokai

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
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'

let g:neocomplcache_enable_at_startup = 1
if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif

" with clang-completion (see neocomplecache FAQ)
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
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

augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.jake setf javascript
    autocmd! BufNewFile,BufRead *.ts   setf javascript
    autocmd! BufNewFile,BufRead *.ejs  setf html
    autocmd! BufNewFile,BufRead *.{tt,mt}   setf html
    autocmd! BufNewFile,BufRead *.md   setf markdown
augroup END


if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

" erase highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

syntax on

set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif

"-------------------------------------------------------------------------------------------------
" commentout visual mode
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
let g:unite_enable_start_insert=1
command! UU Unite buffer file_mru
command! UB Unite buffer
command! UF Unite -buffer-name=register register
command! UC Unite rails/controller
command! UV Unite rails/view
command! UM Unite rails/model

au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" ======== End Of File ========

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-insertmode
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
