" ==================================================================================
"      __          __                __     __             __
"     |__|.-----. |__|.-----..-----.|  |--.|__|    .--.--.|__|.--------..----..----.
"     |  ||  _  | |  ||  _  ||     ||    < |  | __ |  |  ||  ||        ||   _||  __|
"     |  ||_____| |  ||_____||__|__||__|__||__||__| \___/ |__||__|__|__||__|  |____|
"    |___|       |___|
" ==================================================================================

" OS {{{
"====================================================================================================
let s:is_win   = has('win32') || has('win64')
let s:is_mac   = has('mac') || system('uname') =~? '^darwin'
let s:is_linux = !s:is_mac && has('unix')
" }}}

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/jonki/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/jonki/.config/dein')
  call dein#begin('/home/jonki/.config/dein')

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Move
nnoremap J <C-d>
nnoremap K <C-u>
vnoremap J <C-d>
vnoremap K <C-u>
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Buffer
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>


" Folding 
set foldenable
set foldmethod=marker
set foldcolumn=1

" Indent 
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set autoindent smartindent

augroup FileDependentIndentSettings
	autocmd!
	autocmd FileType html setlocal ts=2 sw=2
augroup end

set number
set cursorline

set laststatus=2

colorscheme molokai
set t_ut= " avoid background char color

