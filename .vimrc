﻿filetype off

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
			\	'build' : {
			\		'windows' : 'make -f make_mingw64.mak',
			\		'cygwin'  : 'make -f make_cygwin.mak',
			\		'mac'     : 'make -f make_mac.mak',
			\		'unix'    : 'make -f make_unix.mak',
			\	},
			\ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'

" vim-quickrun-markdown-gfm
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'LeafCage/yankround.vim'

NeoBundleCheck

filetype on
filetype plugin indent on


" Prefix
" ---------------------------------------------------------------------------------------------------
nnoremap [prefix] <nop>
nmap ,   [prefix]
xnoremap [prefix] <nop>
xmap ,   [prefix]

nnoremap [unite] <nop>
xnoremap [unite] <nop>
nmap <Space> [unite]
xmap <Space> [unite]

" Unite
nnoremap [unite]  :Unite
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]o :Unite bookmark<CR>
"nnoremap [unite]f :Unite find<CR>
"nnoremap [unite]g :Unite grep<CR>
"nnoremap [unite]k :Unite fhc<CR>
"nnoremap [unite]l :Unite line<CR>
"nnoremap [unite]m :Unite menu<CR>
"nnoremap [unite]o :Unite outline<CR>
"nnoremap [unite]s :Unite snippet<CR>
"nnoremap [unite]t :Unite tab<CR>

" VimFiler
nnoremap [prefix]vf     :VimFiler<CR>
nnoremap [prefix]vfe    :VimFilerExplorer<CR>

" VimShell
nnoremap [prefix]vs  	:VimShell<CR>
nnoremap [prefix]vsi 	:VimShellInteractive<CR>
nnoremap [prefix]vsc 	:VimShellCreate<CR>
nnoremap [prefix]vsp 	:VimShellPop<CR>

" MemoList.vim 
nnoremap [prefix]mn :set noimdisable<CR>:MemoNew<CR>
nnoremap [prefix]ml :MemoList<CR>
nnoremap [prefix]mg :MemoGrep<CR>

" Quickrun
nnoremap [prefix]rm :QuickRun markdown<CR>

" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


" parameters
let g:memolist_path              = '~/memo'
let g:memolist_memo_suffix       = 'txt'
let g:memolist_memo_date         = '%Y-%m-%d %H:%M'
let g:memolist_prompt_tags       = 0
let g:memolist_prompt_categories = 0
let g:memolist_qfixgrep          = 1
let g:memolist_vimfiler          = 1
let g:memolist_template_dir_path = '~/.vim/template/memolist'

augroup MemoSetFileType
	autocmd!
	autocmd BufNewFile,BufRead *.txt set filetype=memo
augroup END

" vim-quickrun-markdown
let g:quickrun_config = {
			\   'markdown': {
			\     'type': 'markdown/gfm',
			\     'outputter': 'browser'
			\   }
			\ }

" emmet
let g:user_emmet_settings = {
			\   'lang' : 'ja'
			\ }

syntax on
set nocompatible

" Folding 
" {{{ ---------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker
set foldcolumn=1
" }}}

" Indent
" ---------------------------------------------------------------------------------------------------
set noexpandtab
set tabstop=4 shiftwidth=4 softtabstop=0
set autoindent smartindent

augroup FileDependentIndentSettings
	autocmd!
	autocmd FileType html setlocal ts=2 sw=2
	autocmd FileType qml  setlocal expandtab
augroup end

let g:SimpleJsIndenter_BriefMode = 1


" View
set number

colorscheme molokai

" Color
set cursorline
hi Visual term=reverse cterm=reverse guibg=Grey

" iterm cursor
if exists('$ITERM_PROFILE')
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
end

set backspace=start,eol,indent
