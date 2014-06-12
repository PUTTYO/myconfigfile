" vi 互換ではなくVim のデフォルト設定にする
set nocompatible

""" NeoBundelの設定
" 一旦ファイルタイプ関連を無効化
filetype off
filetype plugin indent off
" neobundleでプラグインを管理
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
" 以下のプラグインをバンドル
NeoBundle 'Shougo/unite.vim'

NeoBundle 'groenewege/vim-less'
autocmd BufNewFile,BufRead *.less set filetype=less

NeoBundle 'mklabs/vim-backbone'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'igetgames/vim-backbone-jscomplete'
NeoBundle 'jiangmiao/simple-javascript-indenter'
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1


NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'osyo-manga/unite-qfixhowm'
NeoBundle 'thinca/vim-qfreplace'

NeoBundle 'vim-scripts/jshint.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
"set regexpengine = 1
syntax enable
let javascript_enable_domhtmlcss = 1
"let g:javascript_conceal = 1
"let b:javascript_fold = 1
"syntax match jsFunctionVar /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*=\s*function\s*\)\@=/ containedin=jsFuncBlock,jsBlock,jsParen


NeoBundle 'w0ng/vim-hybrid'

" ステータスラインを綺麗にみせるプラグイン
NeoBundle 'scrooloose/syntastic'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'

NeoBundle 'vim-scripts/dbext.vim'
let dbext_default_profile=""
let dbext_default_type="MYSQL"
let dbext_default_user="mori"
let dbext_default_passwd=""
let dbext_default_dbname="sally"
let dbext_default_host="localhost"
let dbext_default_buffer_lines=20


NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/powerline'
" シンタックス系プラグインをバンドル
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
" 実行プラグインをバンドル
NeoBundle 'thinca/vim-quickrun'
set t_Co=256

"javascriptの実行をnode.jsで
let $JS_CMD='node'

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く(デフォルト設定のこと)
nmap <silent> <Leader>p :Project ~/.vimprojects<CR>
" サブプロジェクトを上に、vimgrepではなくgrepを使うように設定
let g:proj_flags = 'imstTv'

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

syntax on                           " シンタックスハイライト
set encoding=utf8                   " エンコード
set fileencoding=utf-8              " ファイルエンコード
set scrolloff=5                     "スクロールする時に下が見えるようにする
set backspace=indent,eol,start      " バックスペースで各種消せるようにする
set vb t_vb=                        " ビープ音を消す
set novisualbell
set clipboard+=unnamed " OSのクリップボードを使う
set clipboard+=autoselect " OSのクリップボードを使う
"set clipboard=unnamed  " OSのクリップボードを使う
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
set noexpandtab

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
"  php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

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
        autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
        autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
        autocmd FileType lisp       setlocal sw=2 sts=2 ts=2 et
        autocmd FileType markdown   setlocal sw=4 sts=4 ts=4 et
        autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
        autocmd FileType php        setlocal sw=4 sts=4 ts=4 noet
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
"set tags =tags
set tags+=$HOME/code/sally/tags
"au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
"au BufNewFile,BufRead *.* set tags+=$HOME/code/sally/tags
"au BufNewFile,BufRead *.* set tags+=$HOME/code/sally-ui/tags
"au BufNewFile,BufRead *.js set tags+=$HOME/js.tags
"autocmd FileType php set tags=$HOME/.vim/tags/cakephp13.tags,$HOME/.vim/tags/cakephp_app.tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"Tlist
set modifiable
set write
"let g:tlist_php_settings = 'php;c:class;d:constant;f:function'
let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'
"let Tlist_Ctags_Cmd = "/usr/bin/ctags --append=yes"  " ctagsのコマンド
let Tlist_Show_One_File = 1                   "現在表示中のファイルのみのタグしか表示しない
"let Tlist_Use_Right_Window = 1                " 右側にtag listのウインドうを表示する
let Tlist_Use_Light_Window = 1                " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                 " taglistのウインドウだけならVimを閉じる
let Tlist_WinWidth = 50
map <silent> <leader>l :TlistToggle<CR>       "ウインドウを開いたり閉じたり出来るショートカット

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
        return  &ft == 'unite' ? 'Unite' :
               \ &ft == 'vimfiler' ? 'VimFiler' :
               \ &ft == 'vimshell' ? 'VimShell' :
               \ winwidth('.') > 60 ? lightline#mode() : ''
      endfunction

"空白文字をhighlight
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

let g:used_javascript_libs = 'underscore,backbone,jquery,requirejs'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

"au FileType javascript call JavaScriptFold()
"autocmd FileType javascript
"  \ :setl omnifunc=jscomplete#CompleteJS
" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" このようにするとjshintを必ず使ってチェックしてくれるようになる
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_jshint_conf="~/.jshintrc"
"let g:syntastic_auto_loc_list = 1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_mode_map = {
      \  'mode': 'active',
      \ 'active_filetypes': ['php', 'ruby', 'javascript'],
      \ 'passive_filetypes': []
      \ }

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
"let g:unite_enable_split_vertically = 1 "縦分割で開く
"let g:unite_winwidth = 40 "横幅40で開く
" バッファ一覧
nnoremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>
" ファイル一覧
nnoremap :uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap :ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
" 常用セット
nnoremap :uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap :ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"file current_dir
noremap :ufc :Unite file -buffer-name=file<CR>
noremap :ufcr :Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :UniteWithBufferDir file -buffer-name=file
noremap :uffr :UniteWithBufferDir file_rec -buffer-name=file_rec


" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"tmux
syntax enable

"no indent
autocmd FileType * setlocal formatoptions-=ro
set nosmartindent
