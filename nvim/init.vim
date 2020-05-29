" ==================================================================================
"    _       _             _    _              _           
"   (_) ___ (_) ___  _ __ | | _(_)  _ ____   _(_)_ __ ___  
"   | |/ _ \| |/ _ \| '_ \| |/ / | | '_ \ \ / / | '_ ` _ \ 
"   | | (_) | | (_) | | | |   <| |_| | | \ V /| | | | | | |
"  _/ |\___// |\___/|_| |_|_|\_\_(_)_| |_|\_/ |_|_| |_| |_|
" |__/    |__/                                            
" ==================================================================================

" OS {{{
"====================================================================================================
let s:is_win   = has('win32') || has('win64')
let s:is_mac   = has('mac') || system('uname') =~? '^darwin'
let s:is_linux = !s:is_mac && has('unix')
" }}}


" custom prefix {{{
nnoremap [denite] <nop>
xnoremap [denite] <nop>
nmap <Space> [denite]
xmap <Space> [denite]

nnoremap [prefix] <nop>
nmap ,   [prefix]
xnoremap [prefix] <nop>
xmap ,   [prefix]
" }}}

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/dein')
  call dein#begin('~/.config/dein')

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " to delete old packages
  call map(dein#check_clean(), "delete(v:val, 'rf')")

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
au FileType md setlocal foldmethod=indent

" Indent 
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab
set autoindent

augroup FileDependentIndentSettings
	autocmd!
	autocmd FileType html setlocal ts=2 sw=2
augroup end

syntax enable
syntax on

" Color
autocmd ColorScheme * highlight IncSearch ctermbg=17 ctermfg=255
autocmd ColorScheme * highlight Search ctermbg=32 ctermfg=255
colorscheme molokai
set t_ut= " avoid background char color
hi Pmenu ctermbg=4 ctermfg=15
hi PmenuSel ctermbg=11 ctermfg=0

" Common
set number
set cursorline
set laststatus=2
set hlsearch
set clipboard=unnamed

" save cursor position
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


" set completeopt+=noinsert
" set completeopt+=noselect
set completeopt-=preview

let g:python_host_prog = '~/anaconda3/envs/neovim3/bin/python'
let g:python3_host_prog = '~/anaconda3/envs/neovim3/bin/python'
