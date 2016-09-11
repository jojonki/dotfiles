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

" Path {{{
if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" }}}

" Shougo-san's {{{ 
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite.vim'
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
" }}}

" Benchmark {{{
NeoBundleLazy 'mattn/benchvimrc-vim', {
      \ 'autoload': {
      \   'commands': ['BenchVimrc'],
      \  },
      \}
" }}}

" Visual style {{{
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'osyo-manga/vim-anzu'
" }}}

" Key operation enhancer {{{
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'h1mesuke/vim-alignta'
" NeoBundle 'christoomey/vim-tmux-navigator'
" }}}

" Common {{{
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 't9md/vim-textmanip'
" }}}

" Programming (Common) {{{
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'fuenor/qfixgrep'
" }}}

" HTML {{{
NeoBundle 'mattn/emmet-vim'
NeoBundle 'groenewege/vim-less'
" }}}

" Neta {{{
NeoBundle 'thinca/vim-splash'
NeoBundle "osyo-manga/shabadou.vim"
" }}}

" Others {{{
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'tyru/open-browser.vim'
" vim-quickrun-markdown-gfm
" NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
" }}}

" After work {{{
NeoBundleCheck
call neobundle#end()

filetype plugin on
filetype indent on
" }}}

" Common Key Mappings {{{
nnoremap [prefix] <nop>
nmap ,   [prefix]
xnoremap [prefix] <nop>
xmap ,   [prefix]


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

" Tab
nnoremap <TAB>   :tabn<CR>
nnoremap <S-TAB> :tabp<CR>
nnoremap <C-TAB> :tabnew<CR>

" alternative
nnoremap <C-t>   :tabnew<CR>
nnoremap <C-l>   :tabn<CR>
nnoremap <C-h>   :tabp<CR>

" Window
nnoremap <Right> <C-w><
nnoremap <Left>  <C-w>>
nnoremap <Up>    <C-w>-

" }}}

" Unite.vim {{{
nnoremap [unite] <nop>
xnoremap [unite] <nop>
nmap <Space> [unite]
xmap <Space> [unite]

" Unite
nnoremap [unite]  :Unite
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]o :Unite bookmark<CR>
nnoremap [unite]f :Unite find<CR>
nnoremap [unite]g :Unite grep<CR>
nnoremap [unite]k :Unite fhc<CR>
nnoremap [unite]l :Unite line<CR>
nnoremap [unite]m :Unite menu<CR>
nnoremap [unite]o :Unite outline<CR>
nnoremap [unite]s :Unite snippet<CR>
nnoremap [unite]t :Unite tab<CR>

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

" VimFiler {{{
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
" }}}

" VimShell {{{
nnoremap [prefix]vs  	:VimShell<CR>
nnoremap [prefix]vsi 	:VimShellInteractive<CR>
nnoremap [prefix]vsc 	:VimShellCreate<CR>
nnoremap [prefix]vsp 	:VimShellPop<CR>
" }}}

" NeoComplete {{{
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
augroup OmniFiletype
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

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
" }}}

" MemoList.vim  {{{
nnoremap [prefix]mn :set noimdisable<CR>:MemoNew<CR>
nnoremap [prefix]ml :MemoList<CR>
nnoremap [prefix]mg :MemoGrep<CR>

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

" Alignta {{{
nnoremap [unite]a :<C-u>Unite alignta:options<CR>
xnoremap [unite]a :<C-u>Unite alignta:arguments<CR>

let g:unite_source_alignta_preset_arguments = [
      \ ["Align at '='", '=>\='],
      \ ["Align at ':'", '01 :'],
      \ ["Align at ':'", '11 :'],
      \ ["Align at ':'", '01 :/1'],
      \ ["Align at ':'", '11 :/1'],
      \ ["Align at '|'", '|'   ],
      \ ["Align at ')'", '0 )' ],
      \ ["Align at ']'", '0 ]' ],
      \ ["Align at '}'", '}'   ],
      \]

vnoremap a  :Alignta
vnoremap a= :Alignta =<CR>
vnoremap a+ :Alignta +<CR>
vnoremap a: :Alignta 11 :/1<CR>
vnoremap a; :Alignta 11 :/1<CR>
vnoremap a, :Alignta 01 ,<CR>
vnoremap as :Alignta <<0 \s\s*<CR>
vnoremap ae :Alignta -e
vnoremap ar :Alignta -r
vnoremap ap :Alignta -p
vnoremap ag :Alignta g/^\s*
vnoremap av :Alignta v/^\s*
" }}}

" Quickrun {{{
nnoremap [prefix]rm :QuickRun markdown<CR>
nnoremap [prefix]r :QuickRun<CR>

let g:quickrun_config = {}
let g:quickrun_config['_'] = {
  \ 'hook/echo/priority_exit'                      : 100,
  \ 'hook/echo/enable_output_exit'                 : 1,
  \ 'hook/close_unite_quickfix/enable_hook_loaded' : 1,
  \ 'hook/unite_quickfix/enable_failure'           : 1,
  \ 'hook/close_quickfix/enable_exit'              : 1,
  \ 'hook/close_buffer/enable_failure'             : 1,
  \ 'hook/close_buffer/enable_empty_data'          : 1,
  \ 'hook/echo/enable'                             : 1,
  \ 'hook/echo/output_success'                     : '俺はついに見つけた！コードの神髄を！！',
  \ 'hook/echo/output_failure'                     : '...動け、動け、動いてよ。今、動かなきゃ、今、やらなきゃ、みんな死んじゃうんだ。もうそんなのやなんだよ。だから、動いてよ。',
  \ 'hook/inu/enable'                              : 1,
  \ 'hook/inu/echo'                                : 0,
  \ 'hook/inu/wait'                                : 5,
  \ 'hook/time/enable'                             : 1,
  \ 'outputter'                                    : 'multi:buffer:quickfix',
  \ 'outputter/buffer/split'                       : ':botright 8sp',
  \ 'outputter/buffer/close_on_empty'              : 1,
  \ 'runner'                                       : 'vimproc',
  \ 'runner/vimproc/updatetime'                    : 40,
  \ }
" }}}

" emmet {{{
let g:user_emmet_settings = {
			\   'lang' : 'ja'
			\ }
" }}}

"clever-f {{{
let g:clever_f_across_no_line    = 0
let g:clever_f_ignore_case       = 1
let g:clever_f_use_migemo        = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_show_prompt       = 1
" }}}

" anzu.vim {{{
let g:anzu_status_format = 'search : %#WarningMsg#%p %#Keyword#(%i/%l)%#None# : status'
nnoremap <Esc><Esc> :nohlsearch<CR>
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)N
nmap # <Plug>(anzu-)sharp-with-echo)N
" }}}

" Arpeggio Key Mappings {{{
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

" Easy Motion {{{
let s:EasyMotion_keys       = 'hjklasdgqwertyuiopzxcvbnm'
let g:EasyMotion_leader_key = '_'
let g:EasyMotion_grouping   = 1

hi clear EasyMotionTarget
hi clear EasyMotionShade
hi EasyMotionTarget ctermbg=none ctermfg=12  guibg=NONE guifg=#aa0000
hi EasyMotionShade  ctermbg=none ctermfg=232 guibg=NONE guifg=#222222
" }}}

" Folding " {{{
set foldenable
set foldmethod=marker
set foldcolumn=1
" }}}

" Indent {{{
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set autoindent smartindent

augroup FileDependentIndentSettings
	autocmd!
	autocmd FileType html setlocal ts=2 sw=2
augroup end
" }}}

" Copy {{{
nnoremap [prefix]sp  :set paste<CR>
nnoremap [prefix]snp :set nopaste<CR>
augroup SetNoPaste
  autocmd!
  autocmd InsertLeave * if &paste | set nopaste | endif
augroup END
nnoremap p :set paste<CR>p:set nopaste<CR>
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
" }}}

" vim-gitgutter {{{
let g:gitgutter_enabled         = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added      = '+'
let g:gitgutter_sign_modified   = '~'
let g:gitgutter_sign_removed    = '-'

nnoremap [prefix]gg :GitGutterToggle<CR>
nnoremap [prefix]gn :GitGutterNextHunk<CR>
nnoremap [prefix]gN :GitGutterPrevHunk<CR>
" }}}

" Textmanip {{{
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)
" }}}

" Alignta {{{
nnoremap [unite]a :<C-u>Unite alignta:options<CR>
xnoremap [unite]a :<C-u>Unite alignta:arguments<CR>

let g:unite_source_alignta_preset_arguments = [
  \ ["Align at '='", '=>\='],
  \ ["Align at ':'", '01 :'],
  \ ["Align at ':'", '11 :'],
  \ ["Align at ':'", '01 :/1'],
  \ ["Align at ':'", '11 :/1'],
  \ ["Align at '|'", '|'   ],
  \ ["Align at ')'", '0 )' ],
  \ ["Align at ']'", '0 ]' ],
  \ ["Align at '}'", '}'   ],
\]

vnoremap a  :Alignta
vnoremap a= :Alignta =<CR>
vnoremap a+ :Alignta +<CR>
vnoremap a: :Alignta 11 :/1<CR>
vnoremap a; :Alignta 11 :/1<CR>
vnoremap a, :Alignta 01 ,<CR>
" }}}

" yankround {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" }}}

" ctrlp {{{
let g:ctrlp_map = '<C-f>'
let g:ctrlp_working_path_mode = ""
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '\v[\/]\.?(git|hg|svn|node_modules|bower_components)$'
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>'],
  \ 'PrtDeleteWord()':      ['<del>'],
  \ 'PrtCurEnd()':          ['<nop>'],
  \ 'PrtCurLeft()':         ['<nop>'],
  \ 'PrtCurRight()':        ['<nop>'],
  \ 'PrtHistory(-1)':       ['<nop>'],
  \ 'PrtHistory(1)':        ['<nop>'],
  \ 'PrtInsert()':          ['<nop>'],
  \ 'PrtCurStart()':        ['<nop>'],
  \ 'PrtClearCache()':      ['<c-r>'],
  \ 'PrtDeleteEnt()':       ['<nop>'],
  \ 'PrtClear()':           ['<c-d>'],
  \ 'PrtExit()':            ['<nop>', '<esc>', '<c-c>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtDelete()':          ['<nop>'],
  \ 'PrtSelectMove("t")':   ['<nop>'],
  \ 'PrtSelectMove("b")':   ['<nop>'],
  \ 'PrtSelectMove("u")':   ['<nop>'],
  \ 'PrtSelectMove("d")':   ['<nop>'],
  \ 'ToggleRegex()':        ['<F5>'],
  \ 'ToggleByFname()':      ['<nop>'],
  \ 'ToggleFocus()':        ['<nop>'],
  \ 'ToggleType(1)':        ['<nop>'],
  \ 'ToggleType(-1)':       ['<nop>'],
  \ 'AcceptSelection("e")': ['<cr>'], 
  \ 'AcceptSelection("h")': ['<nop>'], 
  \ 'AcceptSelection("t")': ['<nop>'],
  \ 'AcceptSelection("v")': ['<nop>'],
  \ 'CreateNewFile()':      ['<nop>'],
  \ 'MarkToOpen()':         ['<nop>'],
  \ 'OpenMulti()':          ['<nop>'],
  \ }
"" }}}

" html {{{
NeoBundle 'nikvdp/ejs-syntax'
autocmd BufNewFile,BufRead *.ejs set filetype=ejs
autocmd BufNewFile,BufRead *._ejs set filetype=ejs

function! s:DetectEjs()
  if getline(1) =~ '^#!.*\<ejs\>'
    set filetype=ejs
  endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectEjs()

au BufNewFile,BufRead *.tag set filetype=html
" end ctrlp }}}

" Common Settings {{{
" 前回のカーソルポジションで開く
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

let g:splash#path = expand('~/') . '/.vim/bundle/vim-splash/onigiri.txt'

set laststatus=2
set guifont=Ricty\ 10
set backspace=start,eol,indent

set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif

set number
colorscheme molokai
set cursorline
hi Visual term=reverse cterm=reverse guibg=Blue

syntax on
set nocompatible
" }}}

