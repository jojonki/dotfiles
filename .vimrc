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
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "bling/vim-airline"
NeoBundle "osyo-manga/vim-airline-inu"
NeoBundle "osyo-manga/shabadou.vim"

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

NeoBundle 'thinca/vim-splash'
NeoBundleCheck

" JavaScript / TypeScript {{{
" ---------------------------------------------------------------------------------------------------
" NeoBundleLazy 'teramako/jscomplete-vim'
" NeoBundleLazy 'myhere/vim-nodejs-complete'
" NeoBundleLazy 'ahayman/vim-nodejs-complete'
" NeoBundleLazy 'moll/vim-node'
" NeoBundleLazy 'leafgarland/typescript-vim'
" NeoBundleLazy 'jiangmiao/simple-javascript-indenter'
" NeoBundleLazy 'hecomi/vim-javascript-syntax'
" NeoBundleLazy 'pangloss/vim-javascript'
" NeoBundleLazy 'thinca/vim-textobj-function-javascript'
" NeoBundleLazy 'marijnh/tern_for_vim'
" augroup NeoBundleLazyForJavaScript
"   autocmd!
"   autocmd FileType html,javascript,typescript NeoBundleSource
"     \ vim-nodejs-complete
"     \ vim-node
"     \ jscomplete-vim
"     \ typescript-vim
"     \ simple-javascript-indenter
"     \ vim-javascript-syntax
"     \ vim-javascript
"     \ vim-textobj-function-javascript
" augroup END
" autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
" if !exists('g:neocomplcache_omni_functions')
"   let g:neocomplcache_omni_functions = {}
" endif
" let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
"
" let g:node_usejscomplete = 1

" NeoBundleLazyByFileTypes 'othree/javascript-libraries-syntax.vim', ['javascript', 'html']
" }}}

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
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_sort_type            = 'TIME'
let g:vimfiler_file_icon            = '-'
let g:vimfiler_marked_file_icon     = '*'

nnoremap [prefix]vf     :VimFiler<CR>
nnoremap [prefix]vfe    :VimFilerExplorer<CR>
augroup VimFilerCustomKeyBinding
  autocmd!
  autocmd FileType vimfiler nnoremap <buffer> K <C-u>
  autocmd FileType vimfiler nnoremap <buffer> <C-j> :bn<CR>
  autocmd FileType vimfiler nnoremap <buffer> <C-k> :bp<CR>
augroup END

" VimShell
nnoremap [prefix]vs  	:VimShell<CR>
nnoremap [prefix]vsi 	:VimShellInteractive<CR>
nnoremap [prefix]vsc 	:VimShellCreate<CR>
nnoremap [prefix]vsp 	:VimShellPop<CR>

" NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
nmap # <Plug>(anzu-)sharp-with-echo)N

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

" Copy
" "
" ---------------------------------------------------------------------------------------------------
nnoremap [prefix]sp  :set paste<CR>
nnoremap [prefix]snp :set nopaste<CR>
augroup SetNoPaste
  autocmd!
  autocmd InsertLeave * if &paste | set nopaste | endif
augroup END
nnoremap p :set paste<CR>p:set nopaste<CR>

let g:splash#path = expand('~/') . '/.vim/bundle/vim-splash/onigiri.txt'

" Shabadou {{{
" ---------------------------------------------------------------------------------------------------
" " vim-quickrun-markdown
" let g:quickrun_config = {
" 			\   'markdown': {
" 			\     'type': 'markdown/gfm',
" 			\     'outputter': 'browser'
" 			\   }
" 			\ }
"   \ }

" let g:quickrun_config['_'] = {
"   \ 'hook/echo/priority_exit'                      : 100,
"   \ 'hook/echo/enable_output_exit'                 : 1,
"   \ 'hook/close_unite_quickfix/enable_hook_loaded' : 1,
"   \ 'hook/unite_quickfix/enable_failure'           : 1,
"   \ 'hook/close_quickfix/enable_exit'              : 1,
"   \ 'hook/close_buffer/enable_failure'             : 1,
"   \ 'hook/close_buffer/enable_empty_data'          : 1,
"   \ 'hook/echo/enable'                             : 1,
"   \ 'hook/echo/output_success'                     : '俺はついに見つけた！コードの神髄を！！',
"   \ 'hook/echo/output_failure'                     : '...動け、動け、動いてよ。今、動かなきゃ、今、やらなきゃ、みんな死んじゃうんだ。もうそんなのやなんだよ。だから、動いてよ。',
"   \ 'hook/inu/enable'                              : 1,
"   \ 'hook/inu/echo'                                : 0,
"   \ 'hook/inu/wait'                                : 5,
"   \ 'hook/time/enable'                             : 1,
"   \ 'outputter'                                    : 'multi:buffer:quickfix',
"   \ 'outputter/buffer/split'                       : ':botright 8sp',
"   \ 'outputter/buffer/close_on_empty'              : 1,
"   \ 'runner'                                       : 'vimproc',
"   \ 'runner/vimproc/updatetime'                    : 40,
"   \ }

" hook/inu/echo : 0 で echo で出力しないようにする
" }}}

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
