if has('gui_macvim')

    "always show tab
    set showtabline=2

    "change transparency
    set transparency=3

    "moving tab
    map <silent> <C-h> :tabnext<CR>
    map <silent> <C-l> :tabprev<CR>

    set imdisable	               " disenable IM
    set guioptions+=a                  " sent block selected in visual-mode to clipboard
    set guioptions-=T                  " I dont need Tool-bar
    "au GUIEnter * set fullscreen      " boot full screen
    set guifont=Monaco:h12
"    set columns=188                    " just MBA 11'inch
"    set lines=45
    set columns=240                    " just MBP 15'inch
    set lines=90
    set nobackup
    set visualbell t_vb=               " I dont need beep sound
    colorscheme wombat256mod
endif
