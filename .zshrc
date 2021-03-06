#cocos2dx path
export NDK_ROOT=/Users/mori/code/cocos2dx/android-ndk-r9d
export ANDROID_SDK_ROOT=/Users/mori/code/cocos2dx/adt-bundle-mac-x86_64-20140321/sdk
export ANT_ROOT=/usr/local/bin
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/mori/code/cocos2dx/cocos2d-x-3.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

if [ -f ~/phpbrew/bashrc ]; then
    source /home/mori/.phpbrew/bashrc
    export PHPBREW_SET_PROMPT=1
fi

#path
export PATH=$PATH:/usr/local/go/bin
export PATH=/usr/bin:$PATH
# for go lang
if [ -x "`which go`" ]; then
      export GOROOT=`go env GOROOT`
      export GOPATH=$HOME/go
      export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
export PATH=$HOME/.nodebrew/current/bin:$PATH
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

export RBENV_ROOT="$HOME/.rbenv"
export PATH=$RBENV_ROOT/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


#set
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
export GREP_OPTIONS='--binary-files=without-match'

bindkey -v              # キーバインドをviモードに設定
setopt no_beep           # ビープ音
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

# 補完関数の表示を強化する
autoload -U compinit; compinit -u # 補完機能を有効
unsetopt auto_list                #2回目のTABで一覧
setopt list_packed                # 補完候補をできるだけ詰めて表示
setopt list_types                 # 補完候補にファイルの種類も表示
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順("\e[Z"でも動作する)

#zsh-completions
[ -d $HOME/.zsh/zsh-completions/src ] && fpath=($HOME/.zsh/zsh-completions/src $fpath)

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt hist_no_store      # history (fc -l) コマンドをヒストリリストから取り除く。
setopt inc_append_history # すぐにヒストリファイルに追記する。
setopt hist_ignore_dups   # 直前と同じコマンドをヒストリに追加しない
setopt extended_history   # zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集
function history-all { history -E 1 }  # すべてのヒストリを表示

# マッチしたコマンドのヒストリを表示
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### Aliases ###
setopt list_types # 補完候補一覧でファイルの種別をマーク表示
setopt auto_param_keys     # カッコの対応などを自動的に補完
setopt auto_param_slash    # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs           # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt noautoremoveslash   # 最後のスラッシュを自動的に削除しない
limit coredumpsize 102400  # コアダンプサイズを制限
unsetopt promptcr          # 出力の文字列末尾に改行コードが無い場合でも表示
setopt nobeep              # ビープを鳴らさない
setopt long_list_jobs      # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt pushd_ignore_dups   # 同じディレクトリを pushd しない
setopt extended_glob       # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt numeric_glob_sort   # ファイル名の展開で辞書順ではなく数値的にソート
setopt print_eight_bit     # 出力時8ビットを通す(文字化け対策)

# PAGER
if type lv > /dev/null 2>&1; then
    ## lvを優先する。
    export PAGER="lv"
else
    ## lvがなかったらlessを使う。
    export PAGER="less"
fi
if [ "$PAGER" = "lv" ]; then
    ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
    ## -l: 1行が長くと折り返されていても1行として扱う。
    ## （コピーしたときに余計な改行を入れない。）
    export LV="-c -l"
else
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

#aliass
alias hi='history 1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#ls aliases
alias rm='rm -i'
alias vi='vim'
alias vim='vim'

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

#git
alias gls='git ls-files'
alias gMake="git clone git@bitbucket.org:techcrosstest/sally-ui.git"
function gmake() { git clone git@bitbucket.org:techcrosstest/sally-ui2.git $1 ; }


#grep
function GP() { grep $1 -n --include='*.php' -r ./ --color=auto; }
function GJ() { grep $1 -n --include='*.js' -r ./ --color=auto; }
function GH() { grep $1 -n --include='*.html' -r ./ --color=auto; }

#etc
alias sc='source ~/.zshrc'

setopt nocorrect

# source zsh-syntax-highlighting
#mkdir ~/.zsh
#git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
      source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#prompt
#PROMPT='[%F{green}%B%n%b%f@%F{cyan}%d%f] # '
PROMPT='[${HOST}:%F{green}%n%b%f@%F{cyan}%~%f] # '
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
setopt prompt_subst
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '%r:%b'
zstyle ':vcs_info:*' actionformats '%r:%b|%a'
precmd () {
        psvar=()
            LANG=en_US.UTF-8 vcs_info
                [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
#バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|[%F{green}%1v%f]|)"
