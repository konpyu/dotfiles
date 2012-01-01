if has('gui_macvim')

    "常にタブを表示
    set showtabline=2

    "透明度を変更
    set transparency=3

    "タブ移動
    map <silent> <C-h> :tabnext<CR>
    map <silent> <C-l> :tabprev<CR>

    set imdisable	               " IMを無効化
    set guioptions+=a              "ビジュアルモードの選択範囲をclipbordに贈"る
    set guioptions-=T              "ツールバーはいらない
    "au GUIEnter * set fullscreen "フルスクリーンで起動
    set guifont=Monaco:h12
    set columns=188                "MBAだとこのくらい
    set lines=45
    set nobackup
    set visualbell t_vb=           "警告音は要らない
    colorscheme wombat256mod
endif
