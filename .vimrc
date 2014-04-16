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
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'tpope/vim-surround'

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


" MemoList.vim {{{
"====================================================================================================
" map
nnoremap mn :set noimdisable<CR>:MemoNew<CR>
nnoremap ml :MemoList<CR>
nnoremap mg :MemoGrep<CR>

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
" }}}

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
