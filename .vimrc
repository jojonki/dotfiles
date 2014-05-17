" ==================================================================================
"      __          __                __     __             __
"     |__|.-----. |__|.-----..-----.|  |--.|__|    .--.--.|__|.--------..----..----.
"     |  ||  _  | |  ||  _  ||     ||    < |  | __ |  |  ||  ||        ||   _||  __|
"     |  ||_____| |  ||_____||__|__||__|__||__||__| \___/ |__||__|__|__||__|  |____|
"    |___|       |___|
" ==================================================================================


filetype off

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

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-arpeggio'

NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'rhysd/clever-f.vim'
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

"clever-f {{{
"====================================================================================================
let g:clever_f_across_no_line    = 0
let g:clever_f_ignore_case       = 1
let g:clever_f_use_migemo        = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_show_prompt       = 1
" }}}

" anzu.vim {{{
"====================================================================================================
let g:anzu_status_format = 'search : %#WarningMsg#%p %#Keyword#(%i/%l)%#None# : status'
" }}}

" Arpeggio Key Mappings {{{
"====================================================================================================
if !exists('g:arpeggio_loaded')
  let g:arpeggio_loaded = 1

" Settings
" ---------------------------------------------------------------------------------------------------
call arpeggio#load()
let g:arpeggio_timeoutlen = 50

" Window
" ---------------------------------------------------------------------------------------------------
Arpeggio nnoremap wh <C-w>h
Arpeggio nnoremap wj <C-w>j
Arpeggio nnoremap wk <C-w>k
Arpeggio nnoremap wl <C-w>l
Arpeggio nnoremap wo <C-w>o
Arpeggio nnoremap wc <C-w>c
Arpeggio nnoremap wq <C-w>c
Arpeggio nnoremap w8 <C-w>s<Plug>(anzu-star)N
Arpeggio nnoremap w3 <C-w>s<Plug>(anzu-sharp)N

" Split
" ---------------------------------------------------------------------------------------------------
Arpeggio nnoremap sh :vsp<CR>
Arpeggio nnoremap sj :sp<CR><C-w>j
Arpeggio nnoremap sk :sp<CR>
Arpeggio nnoremap sl :vsp<CR><C-w>l

" Easy Motion
" ---------------------------------------------------------------------------------------------------
Arpeggio nmap em _w
Arpeggio nmap EM _b

endif " if !exists('g:arpeggio_loaded')
" }}}

" Search
nnoremap <Esc><Esc> :nohlsearch<CR>
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)N
nmap # <Plug>(anzu-sharp-with-echo)N

" Easy Motion {{{
"====================================================================================================
let s:EasyMotion_keys       = 'hjklasdgqwertyuiopzxcvbnm'
let g:EasyMotion_leader_key = '_'
let g:EasyMotion_grouping   = 1

hi clear EasyMotionTarget
hi clear EasyMotionShade
hi EasyMotionTarget ctermbg=none ctermfg=12  guibg=NONE guifg=#aa0000
hi EasyMotionShade  ctermbg=none ctermfg=232 guibg=NONE guifg=#222222
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
" set noexpandtab
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
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
set encoding=utf-8
