set nocompatible              " be iMproved, required

"TO SETUP Vundle automaticly
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

""" Start Vundle setting
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"------v-----plugins-----v-------------------------------------
Plugin 'VundleVim/Vundle.vim'
" Please list up the plugins you want to use
" Plugin '[Github Author]/[Github repo]'  <-- format
Plugin 'luochen1990/rainbow'          " rainbow brackets
Plugin 'lifepillar/vim-solarized8'    " for solarized theme
Plugin 'tmhedberg/SimpylFold'         " python folding method
Plugin 'XML-Folding'                  " xml/html folding method
Plugin 'ervandew/supertab'            " powerful <tab> button
Plugin 'preservim/nerdtree'           " For NERDTree file explorer
Plugin 'jiangmiao/auto-pairs'         " auto complete pairs
Plugin 'easymotion/vim-easymotion'    " for easy move
Plugin 'airblade/vim-gitgutter'       " for git operation
Plugin 'tpope/vim-fugitive'           " for git operation
Plugin 'lepture/vim-velocity'         " for velocity template filetype *.vm syntax highlight
"------^-----plugins-----^-------------------------------------
call vundle#end()                     " required
filetype plugin indent on             " loading plugin by file extensions
""" end Vundle setting

""" Start Plugin setting
let g:rainbow_active = 1                 " enable rainbow brackets
let g:solarized_termcolors=256           " for solarized theme
set background=dark
colorscheme solarized8_flat
let g:SimpylFold_docstring_preview = 1   " enable python folding with doctrsing preview
let g:SimpylFold_fold_import = 0         " disable folding import codes
let g:NERDTreeShowHidden = 1             " show hidden file in NERDTree
""" end plugin setting

""" Start general setting
set encoding=utf-8                       " set default encoding to UTF-8
set fileencoding=utf-8                   " set default file reading char-code to UTF-8
" Try to read the file by using the char-code below
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformats=unix,dos,mac             " try to fit the file saving format
set mouse=a                              " turn on the MOUSE MODE
set number relativenumber                " set relative line number / vim 7.3+
set smartindent
syntax on                                " set syntax highlight
set hlsearch                             " highlight search result
" set TAB SIZE to 4 
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set backspace=2                          " jump to previous lines end when backspace the first char of the line
set showmatch                            " highlight the matched brackets when cursor is on
set matchtime=1                          " always highlight the matched brackets
set colorcolumn=80                       " 80 chars column highlight
set virtualedit=block                    " allow VISUAL MODE to select char which is not exist
set ignorecase                           " Ignore the case when search
set smartcase                            " If the keyword contains a CAPITAL LETTER, don't ignore case
set wrapscan                             " jump to head/tail if hit the last/first result

"" Cursor related
set cursorline                           " line highlight
" ctermfg - CharactorOfTerminalForeGroundColor
" cterm - FontOfCharactorOfTermial(NORMAL/BOLD)
" ctermbg - CharactorOfTerminalBackGroundColor
" The color code comes from https://jonasjacek.github.io/colors/
highlight CursorLine ctermfg=NONE cterm=underline ctermbg=236
set cursorcolumn                         " column highlight
highlight CursorColumn ctermfg=NONE cterm=NONE ctermbg=236
" hi clear CursorLine                      " Only highlight the current line number (must be set after colorscheme setting)
" highlight of line number
hi CursorLineNr term=bold cterm=NONE ctermfg=232 ctermbg=255
" highlight of Statusline LightGray
highlight StatusLine term=NONE cterm=NONE ctermfg=239 ctermbg=250

"" StatusLine related
" show file name
set statusline=%F
" show the changed status
set statusline+=%m
" show RO if it is opened with ReadOnly mode
set statusline+=%r
" show HELP if it is a help page
set statusline+=%h
" show Prevew if it is a preview window
set statusline+=%w
" the rest of StatusLine setting will be right justified
set statusline+=%=
" show file encoding
set statusline+=[ENC=%{&fileencoding}]
" show current line / total lines
set statusline+=[LOW=%l/%L]
" ALWAYS show the StatusLine(0: never show, 1: only appear if there are 2 or more window)
set laststatus=2
" show complement menu
set wildmenu
set path+=**                     " Provide tab-compiletion for all file related

"------v-----KEY-Binding-----v-------------------------------------

" set <Space> to <Leader>
let mapleader = "\<Space>"

""" Plugin - easymotion
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
""" }

""" Plugin gitgutter {
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
""" }

" <Leader>T to toggle on/off some functionality
nnoremap <Plug>(my-switch) <Nop>
nmap <Leader>t <Plug>(my-switch)
nnoremap <silent> <Plug>(my-switch)s :<C-u>setl spell! spell?<CR>
nnoremap <silent> <Plug>(my-switch)l :<C-u>setl list! list?<CR>
nnoremap <silent> <Plug>(my-switch)t :<C-u>setl expandtab! expandtab?<CR>
nnoremap <silent> <Plug>(my-switch)w :<C-u>setl wrap! wrap?<CR>
nnoremap <silent> <Plug>(my-switch)p :<C-u>setl paste! paste?<CR>

" imap/nmap will replace the command (recursively), which means 'imap a aa' will become to infinite 'aaaaaaaaa...'
" nnoremap/inoremap means Normal/Insert mode NO REcursive MAP
" allow Ctrl-hjkl (and Ctrl-b) cursor moving in INSERT MODE (Ctrl-h might be a BACKSPACE)
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
"nnoremap <C-d> <Del> " Not a good idea for deleting in NORMAL MODE use Ctrl-d

" COMMAND MODE to support ctrl-A, ctrl-E, ctrl-D
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Do Not over write register when use x/s to delete
nnoremap x "_x
nnoremap s "_s

" hit 2 ESC to remove search result highlight
nnoremap <Esc><Esc> :nohlsearch<CR> 

" Indent adjustment with < and > in VisualMode will keep the visual selection
vnoremap < <gv
vnoremap > >gv

" Ctrl-F to toggle open/close folding
nmap <C-f> za
imap <C-f> <C-o>za
" <F2> to fold/unfold all the file 
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
" <F1> to toggle NERDTree (works in NORMAL/INSERT mode)
inoremap <silent> <f1> <C-o>:NERDTreeToggle<CR>
nnoremap <silent> <f1> :NERDTreeToggle<CR>
"------^-----KEY-Binding-----^-------------------------------------

"------v-----auto-command-----v-------------------------------------
""" Plugin NERDTree {
" if the filename is not specified, open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" Close Vim if we close the file (even the NERDTree is opened)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" }

" auto command to set *.conf 's filetype to dosini (a similar syntax but with highlight)
autocmd BufRead,BufNewFile *.conf setf dosini

" Change the colorscheme onChange mode (NORMAL <->INSERT)
set ttimeoutlen=0                                           " set command timeout to 0
" this hook will be triggered at INSERT mode change
augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:ToggleColorscheme('Enter') " The color for INSERT MODE
    autocmd InsertLeave * call s:ToggleColorscheme('Leave') " The color for NORMAL MODE
augroup END

" function for 
function! s:ToggleColorscheme(mode)
  if a:mode == 'Enter'
    highlight CursorLine ctermfg=NONE cterm=NONE ctermbg=237
    highlight CursorColumn ctermfg=NONE cterm=NONE ctermbg=237
    highlight StatusLine term=NONE cterm=NONE ctermfg=Black ctermbg=152 " set StatusLine LightCyan3
  else
    highlight CursorLine ctermfg=NONE cterm=underline ctermbg=236
    highlight CursorColumn ctermfg=NONE cterm=NONE ctermbg=236
    highlight StatusLine term=NONE cterm=NONE ctermfg=239 ctermbg=250 " set Statusline LightGray
  endif
endfunction
"------^-----auto-command-----^-------------------------------------

