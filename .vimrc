""" start Vundle setting/ Vundleに必要な設定
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'luochen1990/rainbow'
Plugin 'tmhedberg/SimpylFold' " python folding method
Plugin 'XML-Folding'          " xml/html folding method
Plugin 'lifepillar/vim-solarized8'

call vundle#end()            " required
filetype plugin indent on    " required
""" end Vundle setting

""" start Plugin setting / プラグインの設定は以下に書く
let g:rainbow_active = 1
""" end plugin setting

set fenc=utf-8 " 文字コードをutf-8

set mouse=a " マウスモードをONにする
set number " 行番号の表示
set smartindent " スマートインデント
syntax on　" 文法ハイライト

set hlsearch " 検索結果ハイライト表示
nmap <Esc><Esc> :nohlsearch<CR><Esc> " ESC連打でハイライト解除
set shiftwidth=4 " 以下四行はtab幅を4文字にする
set softtabstop=4
set tabstop=4
set expandtab
set backspace=2 " カーソルが先頭にあるとき、前の行の末尾に続く
set showmatch " 対になる括弧をハイライト
set matchtime=1 " 対になる括弧のハイライト時間を1にする
set colorcolumn=80 " ８０文字縦ライン

" INSERT MODEでのカーソル移動を<Ctrl>押す時にできるようになる
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" normal terminal short cut
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-d> <C-o>x

" imapでINSERT MODEの() {} "" ''の入力を省力化
imap (<space> ()<Left>
imap {<space> {}<Left><CR><Esc><Up>o<Tab>
imap "<space> ""<Left>
imap '<space> ''<Left>

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

colorscheme ron " デフォルトで入ってるカラースキーム
"""" ステータスライン関連

set cursorline " 行を強調表示
highlight CursorLine ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=240 " カラーコード参照https://jonasjacek.github.io/colors/
set cursorcolumn " 列を強調表示
highlight CursorColumn ctermbg=240
highlight CursorColumn ctermfg=NONE

" hi clear CursorLine " 所在行番号だけをハイライト(必ずcolorschemeの後に設定)
hi CursorLineNr term=bold cterm=NONE ctermfg=232 ctermbg=255 " 行番号の設定


" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" 保管する時に候補一覧表示
set wildmenu
