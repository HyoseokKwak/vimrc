set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" " ESC키를 누르면 한글 모드가 해제
" " 입력모드에서 이전 언어 설정 모드 유지
" inoremap <ESC> <ESC>:set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O    
" 
" " 입력모드에서 Ctrl+d로 백스페이스 기능
" map! <C-d> <BS>

"set si
set sw=4
set ts=4
set noexpandtab
set noai
set nu
set nowrap
set guioptions=Mt
color slate
set bg=dark
set guifont=Bitstream_Vera_Sans_Mono:h10:cHANGEUL
"set guifont=NanumGothicCoding:h9:cHANGEUL
set fileencodings=UTF8 " cp949 
set fileencoding=UTF8 " cp949 
set encoding=cp949
set ignorecase              " 찾기에서 대/소문자를 구별하지 않음
set showcmd                " (부분적인)명령어를 상태라인에 보여줌
set showmatch             " 매치되는 괄호의 반대쪽을 보여줌
set autowrite                " :next나  :make 같은 명령를 입력하면 자동으로 저장
set linespace=3            " 줄간격
set langmenu=none
" lang en
set history=50000
set nobackup 

set nocompatible               " be iMproved
filetype off                   " required!

set list
set listchars=tab:\|\ 
set updatetime=1000

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
"
"Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'neocomplcache-snippets_complete'
Bundle 'neocomplcache'
Bundle 'multvals.vim'
Bundle 'genutils'
Bundle 'taglist.vim'
Bundle 'SelectBuf'
""Bundle 'colorscheme_template.vim'
Bundle 'tcommand'
Bundle 'tlib'
Bundle 'tComment'
"Bundle 'vmark.vim--Visual-Bookmarking'
Bundle 'ShowMarks7'
Bundle 'Tagbar'
Bundle 'ShowFunc'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


vmap <M-?> :s/^\/\///g
vmap <M-/> :s/^/\/\//g
"map <M-`> wi'bi'

map ;; :ls
map <Up> :res +100
map <C-h> gT
map <C-l> gT
"map! <F1> <ESC><F1>
map <F2> :w!<CR>
" F3은 새탭 열기, Ctrl+h,l로 탭 이동
"map <F3> :tabnew<CR>            
"map <F3> :FufTagWithCursorWord!<CR>
" F4는 디렉토리 목록 열기, Ctrl+Enter로 파일 선택 후 디렉토리 목록 닫기
"map <F4> :25vs<CR>:E<CR>
"map <C-CR> P<C-w><C-h><C-w><C-c>
" F5는 파일에 대한 설명을, Ctrl+F5는 함수에 대한 설명을 주석으로 달기
"map <F5> <Plug>CommentFileDes
"map <C-F5> <Plug>CommentFuncDes
"map <F4> :FufFile \project-workspace\moctep\web\ep\**\<CR>
"map <F5> :FufFile \project-workspace\moctep\web\ext\script\**\<CR>
"map <s-F5> :FufFile \project-workspace\moctep\src\**\<CR>
"map <F6> :FufBookmark<CR>
"map <s-F6> :FufAddBookmark<CR>
"map <F7> :FufBuffer<CR>
map <F8> :set ft=javascript<CR>
map <F9> V"ay:e a<BS><CR>

map <F6> <Plug>ShowFunc
map! <F6> <Plug>ShowFunc

"map <F10> :silent !c:\lib\apache-ant-1.8.2\bin\ant -f c:\dev\workspace\DW_Tool_dev\build.xml<CR>
"
"nnoremap <silent> <F8> :TlistToggle<CR>
"
"nnoremap <silent> <C-n>      :FufBuffer<CR>
"nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
"nnoremap <silent> <C-f>p     :FufFile<CR>
"nnoremap <silent> <C-j>      :FufMruFile<CR>
"nnoremap <silent> <C-k>      :FufMruCmd<CR>
"nnoremap <silent> <C-b>      :FufBookmark<CR>
"nnoremap <silent> <C-f><C-t> :FufTag<CR>
"nnoremap <silent> <C-f>t     :FufTag!<CR>
"nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
"nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
"nnoremap <silent> <C-f><C-r> :FufRenewCache<CR

"FuzzyFinder setting
" exclude some file
" let g:fuf_file_exclude = '\v\~$|\.(o|xml|exe|dll|bak|swp|png|gif|jpg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
" let g:fuf_ignoreCase=1
" let g:fuf_mrufile_maxItem=300

"Auto complet
" let g:acp_behaviorSnipmateLength=-1
" let g:acp_behaviorKeywordLength=2 

" F8은 Taglist 목록 열기
"map <F8> :TlistToggle<CR>
" nnoremap <silent> <F11> :YRShow<CR>
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
" set nocompatible        " Use Vim defaults instead of 100% vi compatibility
" set backspace=2         " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
" au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
" au BufWrite /private/etc/pw.* set nowritebackup

" Disable AutoComplPop. 
let g:acp_enableAtStartup = 0 
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

" Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
    \ 'default' : '', 
    \ 'vimshell' : $HOME.'/.vimshell_hist', 
    \ 'scheme' : $HOME.'/.gosh_completions' 
    \ } 

" Define keyword. 
if !exists('g:neocomplcache_keyword_patterns') 
    let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

" Plugin key-mappings. 
imap <C-k>     <Plug>(neocomplcache_snippets_expand) 
smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
inoremap <expr><C-g>     neocomplcache#undo_completion() 
inoremap <expr><C-l>     neocomplcache#complete_common_string() 

" SuperTab like snippets behavior. 
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>" 

" " Recommended key-mappings. 
" " <CR>: close popup and save indent. 
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" " <TAB>: completion. 
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" " <C-h>, <BS>: close popup and delete backword char. 
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
" inoremap <expr><C-y>  neocomplcache#close_popup() 
" inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" AutoComplPop like behavior. 
"let g:neocomplcache_enable_auto_select = 1 


"GUI 이면, 시작시 크기 설정
if has("gui_running")
    set lines=55
    set co=90
endif



set tags=c:\bin\tags
