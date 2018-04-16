set fenc=utf-8

set mouse=a " マウスモードをONにする
set number " 行番号の表示
set smartindent " スマートインデント
syntax on　" 文法ハイライト

set hlsearch
set shiftwidth=4 " 以下四行はtab幅を4文字にする
set softtabstop=4
set tabstop=4
set expandtab
set backspace=2 " カーソルが先頭にあるとき、前の行の末尾に続く
set showmatch " 対になる括弧をハイライト
set matchtime=1 " 対になる括弧のハイライト時間を1にする

set colorcolumn=80

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

colorscheme ron " デフォルトで入ってるカラースキーム

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
