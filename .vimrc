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
Plugin 'tmhedberg/SimpylFold'         " python folding method
Plugin 'XML-Folding'                  " xml/html folding method
Plugin 'lifepillar/vim-solarized8'    " for theme
Plugin 'ervandew/supertab'            " powerful <tab> button
Plugin 'preservim/nerdtree'           " For NERDTree file explorer
Plugin 'jiangmiao/auto-pairs'         " auto complete pairs
Plugin 'easymotion/vim-easymotion'    " for easy move
Plugin 'airblade/vim-gitgutter'       " for git operation
Plugin 'tpope/vim-fugitive'           " for git operation
"------^-----plugins-----^-------------------------------------
call vundle#end()            " required
filetype plugin indent on    " ファイル形式別プラグインのロードを有効化
""" end Vundle setting

""" start Plugin setting / プラグインの設定は以下に書く
let g:rainbow_active = 1
let g:solarized_termcolors=256 " for solarized theme
set background=dark
colorscheme solarized8_flat
let g:SimpylFold_docstring_preview = 1 " enable python folding with doctrsing preview
let g:SimpylFold_fold_import = 0 " disable folding import codes
let g:NERDTreeShowHidden = 1 " show hidden file in NERDTree
""" end plugin setting

""" Start general setting
set encoding=utf-8 " 内部文字コードをutf-8に
set fileencoding=utf-8 " ファイル書き込み時の文字コードをutf-8に
set fileencodings=utf-8,cp932,sjis " ファイル読み取り時の文字コードを順番に試みる
set fileformats=unix,dos,mac " ファイルの保存形式を順番に試みる
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
set ignorecase " 大文字・小文字の区別なく検索する
set smartcase " 検索文字列に大文字が含まれたら、区別して検索
set wrapscan " 検索時に最後まで行ったら最初に戻る
"" カーソルライン関連
set cursorline " 行を強調表示
highlight CursorLine ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=236 " カラーコード参照https://jonasjacek.github.io/colors/
set cursorcolumn " 列を強調表示
highlight CursorColumn ctermbg=236
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
set path+=**                     " Provide tab-compiletion for all file related

"------v-----KEY-Binding-----v-------------------------------------

" set <Space> to <Leader>
let mapleader = "\<Space>"
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" <Leader>s{char}{char} to move to {char}{char}
map <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" some <Leader> key bind for git operation
nnoremap <leader>gs :tab sp<CR>:Gstatus<CR>:only<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gh :tab sp<CR>:0Glog<CR>
" abbrev for `git history`: create new quickfix tab for history
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gr :Grebase -i<CR>
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gm :Gmerge 

" <Leader>Tで各機能のトグルの切り替え
nnoremap <Plug>(my-switch) <Nop>
nmap <Leader>t <Plug>(my-switch)
nnoremap <silent> <Plug>(my-switch)s :<C-u>setl spell! spell?<CR>
nnoremap <silent> <Plug>(my-switch)l :<C-u>setl list! list?<CR>
nnoremap <silent> <Plug>(my-switch)t :<C-u>setl expandtab! expandtab?<CR>
nnoremap <silent> <Plug>(my-switch)w :<C-u>setl wrap! wrap?<CR>
nnoremap <silent> <Plug>(my-switch)p :<C-u>setl paste! paste?<CR>

" imap/nmapはただのコマンド置換、再帰的に置換される　imap a aaは無限に実行される
" nnoremap/inoremapは再帰的に置換を行わない、
" INSERT MODEでのカーソル移動を<Ctrl>押す時にできるようになる
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-b> <Left>
imap <C-l> <Right>

" use K/J to move fast (half screen up or down
nnoremap K <C-u>zz
nnoremap J <C-d>zz

" mapping search result going to middle of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap * *zz
nnoremap g* g*zz
nnoremap g# g#zz

" NORMAL/INSERT MODE terminal shortcut ctrl-A, ctrl-E, ctrl-D
inoremap <C-e> <End>
nnoremap <C-e> <End>
inoremap <C-a> <Home>
nnoremap <C-a> <Home>
inoremap <C-d> <Del>
nnoremap <C-d> <Del>

" COMMAND MODE to support ctrl-A, ctrl-E, ctrl-D
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Do Not over write register when use x/s to delete
nnoremap x "_x
nnoremap s "_s

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR> 

" Ctrl-F to toggle open/close folding / Ctrl-Fで折りたたみの開閉
nmap <C-f> za
imap <C-f> <C-o>za
" <F2> to fold/unfold all the file/ <F2>ですべての折りたたみを展開/折りたたむ 
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
" <F1> to toggle NERDTree / <F1>でNERDTreeを開く/閉じる、<INSERT/NORMAL>モードで動く
inoremap <silent> <f1> <C-o>:NERDTreeToggle<CR>
nnoremap <silent> <f1> :NERDTreeToggle<CR>
"------^-----KEY-Binding-----^-------------------------------------

"------v-----auto-command-----v-------------------------------------
" ファイル名指定せずにvimに入ると、直接NERDTreeを開く
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" NERDTree + fileの状態でfileを閉じると、NERDTreeも一緒に閉じる(vimが閉じる)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" INSERT/NORMALモード移行する時のcolorschemeを変更
set ttimeoutlen=0 " タイムアウトの時間を0に
augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:ToggleColorscheme('Enter') "挿入モード時の色
    autocmd InsertLeave * call s:ToggleColorscheme('Leave') "通常モード時の色
augroup END

function! s:ToggleColorscheme(mode)
  if a:mode == 'Enter'
    colorscheme solarized8
    highlight CursorLine cterm=NONE ctermbg=237 " カラーコード参照https://jonasjacek.github.io/colors/
    highlight CursorColumn ctermbg=237
  else
    colorscheme solarized8_flat
    highlight CursorLine cterm=NONE ctermbg=236 " カラーコード参照https://jonasjacek.github.io/colors/
    highlight CursorColumn ctermbg=236
  endif
endfunction
"------^-----auto-command-----^-------------------------------------

