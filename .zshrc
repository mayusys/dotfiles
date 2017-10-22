#!/usr/local/bin/zsh

export LANG=ja_JP.UTF-8
export MANLANG=ja_JP.UTF-8
export LC_TIME=en_US.UTF-8

export CPUCORES="$(getconf _NPROCESSORS_ONLN)"

export PROGRAMMING=$HOME/Documents/Develop
export XDG_CONFIG_HOME=$HOME/.config

# 色を使用出来るようにする
    autoload -Uz colors
    colors

# ヒストリ設定
    HISTFILE=$HOME/.zsh_history
    HISTSIZE=1000000
    SAVEHIST=1000000
    setopt append_history
    setopt hist_ignore_all_dups
    setopt hist_ignore_space
    setopt hist_reduce_blanks
    setopt hist_save_no_dups

# 補完
    setopt auto_param_keys
    setopt auto_param_slash

# プロンプト設定
    PROMPT="%{${fg[cyan]}%}%/ $%{${reset_color}%} %"

# 単語の区切り指定
    autoload -Uz select-word-style
    select-word-style default
    zstyle ':zle:*' word-chars " _-./;@"
    zstyle ':zle:*' word-style unspecified

# cd
    alias cddev='cd $HOME/Documents/Develop'
    alias cdgo='cd $HOME/Documents/Develop/go'
    alias cddot='cd $HOME/Documents/Develop/dotfiles'

# GO
    if [ -x "`which go`" ]; then
        export GOROOT=`go env GOROOT`
        export GOPATH=$PROGRAMMING/go
        export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
        export GO15VENDOREXPERIMENT=1
    fi
