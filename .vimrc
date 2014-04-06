filetype off

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'


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

" Color
" ---------------------------------------------------------------------------------------------------
colorscheme molokai
