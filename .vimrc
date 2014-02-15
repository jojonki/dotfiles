set nocompatible
filetype off

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" My Bundles here:
" Refer to |:NeoBundle-examples|.
"
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

" molokai カラースキーム
" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'

" VimFiler Setting
" autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
 
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default=0
" let g:netrw_liststyle=3
let g:vimfiler_edit_action = 'tabopen'

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

filetype on
filetype plugin indent on

" Prefix
" ---------------------------------------------------------------------------------------------------
nnoremap [prefix] <nop>
nmap ,   [prefix]
xnoremap [prefix] <nop>
xmap ,   [prefix]

" 選択したテキストの移動
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right) 

nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

nnoremap <silent> vf :VimFiler<CR>



" Folding 
" {{{ ---------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker
set foldcolumn=1
" }}}

" Cursorline
" ---------------------------------------------------------------------------------------------------
set cursorline

" Status Line
" ---------------------------------------------------------------------------------------------------
set cmdheight=2
set laststatus=2

" Titley
" ---------------------------------------------------------------------------------------------------
set title
set titlestring=JonVim:\ %f\ %h%r%m
set ttimeoutlen=10

" View
" ---------------------------------------------------------------------------------------------------
set autoindent
set number
syntax on

"Input Assist
" ---------------------------------------------------------------------------------------------------
set backspace=start,eol,indent
"imap <c-> <esc>

" Indent
" ---------------------------------------------------------------------------------------------------
set noexpandtab
set tabstop=4 shiftwidth=4 softtabstop=0
set autoindent smartindent

