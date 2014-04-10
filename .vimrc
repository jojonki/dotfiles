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

" View
set number

colorscheme molokai

" Color
set cursorline

" Line number
" ---------------------------------------------------------------------------------------------------
let s:default_updatetime   = &updatetime
let s:immediate_updatetime = 10

function! s:CursorLineNrColorDefault()
	if &updatetime == s:immediate_updatetime
		let &updatetime = s:default_updatetime
	endif
	hi CursorLineNr ctermfg=33 guifg=#268bd2
	hi CursorLine   cterm=none gui=none
	hi Cursor       gui=inverse,bold
endfunction

function! s:CursorLineNrColorInsert(mode)
	if a:mode == 'i'
		hi CursorLineNr ctermfg=64 guifg=#859900
		"hi CursorLine   cterm=underline gui=underline
	elseif a:mode == 'r'
		hi CursorLineNr ctermfg=124 guifg=#ff0000
		hi CursorLine  cterm=underline gui=undercurl
	elseif a:mode == 'replace-one-character'
		let &updatetime = s:immediate_updatetime
		hi CursorLineNr ctermfg=124 guifg=#ff0000
		hi CursorLine   cterm=underline gui=none
		hi Cursor       guifg=#ff0000 gui=inverse
	endif
endfunction

function! s:CursorLineNrColorVisual()
	let &updatetime = s:immediate_updatetime
	hi CursorLineNr ctermfg=61 guifg=#6c71c4
	hi CursorLine   cterm=none gui=none
	return ''
endfunction

vnoremap <silent> <expr> <SID>(CursorLineNrColorVisual)  <SID>CursorLineNrColorVisual()
" MEMO: need 'lh' to fire CursorMoved event to update highlight..., not cool.
nnoremap <silent> <script> v v<SID>(CursorLineNrColorVisual)lh
nnoremap <silent> <script> V V<SID>(CursorLineNrColorVisual)lh
nnoremap <silent> <script> <C-v> <C-v><SID>(CursorLineNrColorVisual)lh
nnoremap r :call <SID>CursorLineNrColorInsert('replace-one-character')<CR>r

augroup ChangeLineNumber
	autocmd!
	autocmd VimEnter    * call s:CursorLineNrColorDefault()
	autocmd InsertEnter * call s:CursorLineNrColorInsert(v:insertmode)
	autocmd InsertLeave * call s:CursorLineNrColorDefault()
	autocmd CursorHold  * call s:CursorLineNrColorDefault()
augroup END

