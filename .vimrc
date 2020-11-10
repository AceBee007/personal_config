set nocompatible              " be iMproved, required

"自動にVundleをセットアップする部分
" /-/-/- START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :source $MYVIMRC
  :PluginInstall
endif
" \-\-\- END - Setting up Vundle - the vim plugin bundler

""" start Vundle setting/ Vundleに必要な設定
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"------v-----plugins-----v-------------------------------------
Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'luochen1990/rainbow'
Plugin 'tmhedberg/SimpylFold' " python folding method
Plugin 'XML-Folding'          " xml/html folding method
Plugin 'lifepillar/vim-solarized8'
Plugin 'ervandew/supertab'    " powerful <tab> button
Plugin 'preservim/nerdtree'   " For NERDTree file explorer
Plugin 'jiangmiao/auto-pairs' " auto complete pairs
"------^-----plugins-----^-------------------------------------
call vundle#end()            " required
filetype plugin indent on    " ファイル形式別プラグインのロードを有効化
""" end Vundle setting

""" start Plugin setting / プラグインの設定は以下に書く
let g:rainbow_active = 1
let g:solarized_termcolors=256 " for solarized theme
set background=dark
colorscheme solarized8
let g:SimpylFold_docstring_preview = 1 " enable python folding with doctrsing preview
let g:SimpylFold_fold_import = 0 " disable folding import codes
let g:NERDTreeShowHidden = 1 " show hidden file in NERDTree
""" end plugin setting

""" Start general setting
set fenc=utf-8 " 文字コードをutf-8
set mouse=a " マウスモードをONにする
set number " 行番号の表示
set smartindent " スマートインデント
syntax on　" 文法ハイライト
set hlsearch " 検索結果ハイライト表示
set shiftwidth=4 " 以下四行はtab幅を4文字にする
set softtabstop=4
set tabstop=4
set expandtab
set backspace=2 " カーソルが先頭にあるとき、前の行の末尾に続く
set showmatch " 対になる括弧をハイライト
set matchtime=1 " 対になる括弧のハイライト時間を1にする
set colorcolumn=80 " ８０文字縦ライン
set virtualedit=block " vim の矩形選択で文字が無くても右へ進める
"" カーソルライン関連
set cursorline " 行を強調表示
highlight CursorLine ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=236 " カラーコード参照https://jonasjacek.github.io/colors/
set cursorcolumn " 列を強調表示
highlight CursorColumn ctermbg=237
highlight CursorColumn ctermfg=NONE
" hi clear CursorLine " 所在行番号だけをハイライト(必ずcolorschemeの後に設定)
hi CursorLineNr term=bold cterm=NONE ctermfg=232 ctermbg=255 " 行番号の設定
"" ステータスライン関連
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

"------v-----KEY-Binding-----v-------------------------------------
" imap/nmapはただのコマンド置換、再帰的に置換される　imap a aaは無限に実行される
" nnoremap/inoremapは再帰的に置換を行わない、
" INSERT MODEでのカーソル移動を<Ctrl>押す時にできるようになる
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" NORMAL/INSERT MODE terminal short cut ctrl-A, ctrl-E, ctrl-D
imap <C-e> <C-o>$
nmap <C-e> $
imap <C-a> <C-o>0
nmap <C-a> 0
imap <C-d> <C-o>x
nmap <C-d> x

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc> 

" Ctrl-F to toggle open/close folding / Ctrl-Fで折りたたみの開閉
nmap <C-f> za
imap <C-f> <C-o>za
" <F2> to fold/unfold all the file/ <F2>ですべての折りたたみを展開/折りたたむ 
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
" <F1> to toggle NERDTree / <F1>でNERDTreeを開く/閉じる、<INSERT/NORMAL>モードで動く
inoremap <silent> <f1> :NERDTreeToggle<CR>
nnoremap <silent> <f1> :NERDTreeToggle<CR>
"------^-----KEY-Binding-----^-------------------------------------

"------v-----auto-command-----v-------------------------------------
" ファイル名指定せずにvimに入ると、直接NERDTreeを開く
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" NERDTree + fileの状態でfileを閉じると、NERDTreeも一緒に閉じる(vimが閉じる)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------^-----auto-command-----^-------------------------------------

