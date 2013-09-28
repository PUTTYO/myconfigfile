" vi 互換ではなくVim のデフォルト設定にする
set nocompatible

""" NeoBundelの設定
" 一旦ファイルタイプ関連を無効化
filetype off
" neobundleでプラグインを管理
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
" 以下のプラグインをバンドル
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/powerline'
" Perl関連プラグインをバンドル
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
" シンタックス系プラグインをバンドル
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
" 実行プラグインをバンドル
NeoBundle 'thinca/vim-quickrun'
"undo
NeoBundle 'sjl/gundo'
set t_Co=256

"javascriptの実行をnode.jsで
let $JS_CMD='node'

"colorscheme
let g:hybrid_use_Xresources = 1
colorscheme hybrid

"buffer
nnoremap <silent>bf :bf<CR>
nnoremap <silent>bl :bl<CR>
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>

filetype plugin on
filetype indent on

" 環境設定系
syntax on                           " シンタックスハイライト
set encoding=utf8                   " エンコード
set fileencoding=utf-8              " ファイルエンコード
set scrolloff=5                     "スクロールする時に下が見えるようにする
set backspace=indent,eol,start      " バックスペースで各種消せるようにする
set vb t_vb=                        " ビープ音を消す
set novisualbell
set clipboard+=unnamed " OSのクリップボードを使う
set clipboard=unnamed  " OSのクリップボードを使う
set list " 不可視文字を表示
set number  " 行番号を表示
set ruler " 右下に表示される行・列の番号を表示する
set nostartofline " 移動コマンドを使ったとき、行頭に移動しない
set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加
set showmatch " 対応括弧をハイライト表示する
set matchtime=3 " 対応括弧の表示秒数を3秒にする
set wrap " ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
" 不可視文字を表示
"set listchars=tab:>-,extends:<,trail:-,eol:\
set listchars=tab:>-,extends:<,trail:-
highlight NonText guifg=darkgreen
"set shiftround

set infercase " 補完の際の大文字小文字の区別しない
set hidden " 変更中のファイルでも、保存しないで他のファイルを表示
set switchbuf=useopen " 新しく開く代わりにすでに開いてあるバッファを開く
"set ignorecase " 小文字の検索でも大文字も見つかるようにする
set smartcase " ただし大文字も含めた検索の場合はその通りに検索する
set incsearch " インクリメンタルサーチを行う
set hlsearch " 検索結果をハイライト表示
set history=10000 " コマンド、検索パターンを10000個まで履歴に残す
set ttymouse=xterm2 " xtermとscreen対応
set showcmd " コマンドを画面最下部に表示する

set tabstop=4 " タブを表示するときの幅
set shiftwidth=4 " タブを挿入するときの幅
set expandtab

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
 
" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
 
    if a:bang == ''
        pwd
    endif
endfunction
 
" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif

" PHP用設定
" PHP辞書ファイル指定
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
let php_folding = 0 " PHPの関数やクラスの折りたたみ
let php_sql_query = 1   "文字列の中のSQLをハイライト
let php_baselib = 1 " Baselibメソッドのハイライト
let php_htmlInStrings = 1 " HTMLもハイライト
let php_noShortTags = 1 " <? を無効にする→ハイライト除外にする
let php_parent_error_close = 1 " ] や ) の対応エラーをハイライト
let php_parent_error_open = 1
" SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
function! SQLToPHP()
%s/^\(.\+\)$/"\1 " \./g

normal G$
execute "normal ?.&lt;CR&gt;"
normal xxggVG
echo "Convert to PHP String is finished."
endfunction
command! Sqltop :call SQLToPHP()
function! SQLFromPHP()
%s/^"\(.\+\) " *\.*$/\1/g

normal ggVG
echo "Convert from PHP String is finished."
endfunction
command! Sqlfromp :call SQLFromPHP()
" ハイライト色設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" Perl用設定
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
" Enable snipMate compatibility feature.↲
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/snippets'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = { 'default'    : '', 'perl'       : $HOME . '/.vim/dict/perl.dict' }

" Java用設定
"SQLのJava文字リテラルへの整形(:Sqltoj, :Sqlfromj)
function! SQLToJava()
%s/^\(.\+\)$/"\1 " \+/g

normal G$
execute "normal ?+\&lt;CR&gt;"
normal xxggVG
echo "Convert to Java String is finished."
endfunction
command! Sqltoj :call SQLToJava()
function! SQLFromJava()
%s/^"\(.\+\) " *+*$/\1/g

normal ggVG
echo "Convert from Java String is finished."
endfunction
command! Sqlfromj :call SQLFromJava()

" Ruby用設定
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" \ + rでスクリプト実行
nmap <Leader>r <plug>(quickrun)

" 全角スペースのハイライトを設定
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" 大文字を区切りとしたワイルドカードのように振る舞う機能
let g:neocomplcache_enable_camel_case_completion = 1
" _区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_smart_case = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
"手動補完時に補完を行う入力数を制御
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
 
" 補完ウィンドウの設定
set completeopt=menuone
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \ }


if !exists('g:neocomplcache_keyword_patterns')
	        let g:neocomplcache_keyword_patterns = {}
endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	" スニペットを展開する。スニペットが関係しないところでは行末まで削除
	imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
	smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
	" 前回行われた補完をキャンセルします
	inoremap <expr><C-g> neocomplcache#undo_completion()
	" 補完候補のなかから、共通する部分を補完します
	inoremap <expr><C-l> neocomplcache#complete_common_string()
	" 改行で補完ウィンドウを閉じる
	inoremap <expr><CR> neocomplcache#smart_close_popup()
	"tabで補完候補の選択を行う
	inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
	inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
	" <C-h>や<BS>を押したときに確実にポップアップを削除します
"	inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
	" 現在選択している候補を確定します
	inoremap <expr><C-y> neocomplcache#close_popup()
	" 現在選択している候補をキャンセルし、ポップアップを閉じます
	inoremap <expr><C-e> neocomplcache#cancel_popup()


"閉じた場所のkioku1:
if has("autocmd")
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
endif

if has("autocmd")
        filetype indent on
        " 無効にしたい場合
        " autocmd FileType html filetype indent off
        "
        autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
        autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
        autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
        autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
        autocmd FileType conf       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
        autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
        autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType html       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
        autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
        autocmd FileType lisp       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType markdown   setlocal sw=4 sts=4 ts=4 et
        autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
        autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType gitcommit  setlocal sw=2 sts=2 ts=2 et
        autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
        autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
        autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
        autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
        autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
        autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
        autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
endif
autocmd InsertLeave * set nopaste


"ctags
set tags =tags
"au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
au BufNewFile,BufRead *.* set tags+=$HOME/project/sally-ui/tags
"au BufNewFile,BufRead *.js set tags+=$HOME/js.tags
"autocmd FileType php set tags=$HOME/.vim/tags/cakephp13.tags,$HOME/.vim/tags/cakephp_app.tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

"Tlist
let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1                   "現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                 " taglistのウインドウだけならVimを閉じる
map <silent> <leader>l :TlistToggle<CR>       "ウインドウを開いたり閉じたり出来るショートカット

"srcexpl
" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" ,
        \ "Source_Explorer"
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 1 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"lightline
set laststatus=2
"export TERM=xterm-256color
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
      return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
    endfunction

    function! MyFilename()
        return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
                \  &ft == 'unite' ? unite#get_status_string() : 
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
      endfunction

      function! MyFugitive()
        if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
          let _ = fugitive#head()
          return strlen(_) ? '⭠ '._ : ''
        endif
        return ''
      endfunction

      function! MyFileformat()
        return winwidth('.') > 70 ? &fileformat : ''
      endfunction

      function! MyFiletype()
        return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
      endfunction

      function! MyFileencoding()
        return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
      endfunction

      function! MyMode()
        return winwidth('.') > 60 ? lightline#mode() : ''
      endfunction

"空白文字をhighlight
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


"no indent
autocmd FileType * setlocal formatoptions-=ro
set nosmartindent
