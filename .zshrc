# global paths
case "${OSTYPE}" in
darwin*)
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH # brew
    export PATH=/usr/local/share/npm/bin:$PATH # npm
    export PATH=$HOME/android-sdk-macosx/platform-tools:$PATH
    export PATH=$HOME/n/bin:$PATH
    export PATH=$PYENV_ROOT/bin:$PATH
    export PYENV_ROOT="$HOME/.pyenv"
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    ;;
freebsd*|linux*)
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    export PATH=/usr/bin/X11:$PATHexport PATH=/usr/sbin:$PATH
    export PATH=/sbin:$PATH
    export PATH=/var/qmail/bin:$PATH
    export PATH=/usr/local/apache/bin:$PATH
    export PATH=$HOME/bin:$PATH
    export PATH=$HOME/script/tool:$PATH
    export PATH=$HOME/script/daemon:$PATH
    export PATH=.:$PATH
    export EDITOR=vi
    ;;
esac

export SHELL=/bin/zsh
export SVN_EDITOR=${EDITOR}

# lang
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# prompt
autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    autoload -Uz add-zsh-hook
    autoload -Uz colors
    colors
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git svn hg bzr
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true

    autoload -Uz is-at-least
    if is-at-least 4.3.10; then
        if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
            zstyle ':vcs_info:git:*' check-for-changes false
        else
            zstyle ':vcs_info:git:*' check-for-changes true
        fi
        zstyle ':vcs_info:git:*' stagedstr "+"
        zstyle ':vcs_info:git:*' unstagedstr "-"
        zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
        zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
    fi

    function _update_vcs_info_msg() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg
    RPROMPT="%1(v|%F{green}%1v%f|)"
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# Keybind configuration
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

# Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=500000000
SAVEHIST=500000000
setopt hist_ignore_dups
setopt share_history

# Completion configuration
fpath=(${HOME}/.zsh/completion/src $fpath)
autoload -U compinit && compinit

# zsh editor
autoload zed

# Alias configuration
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias la="ls -la"
alias lf="ls -F"
alias ll="ls -lh"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias st="git status"
alias where="command -v"
alias j="jobs -l"
alias cl="clear"
alias op="open ."

# OS dependancy
case "${OSTYPE}" in
darwin*)
    alias ls="ls -G -w"
    # alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    # alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias edit="vim --split=tabedit $$args"
    alias e="edit"

    alias quicklook='qlmanage -p "$@" >& /dev/null'
    alias l=quicklook

    alias ssh='ssh -o StrictHostKeyChecking=no'
    alias dev='ssh dev'
    ;;
freebsd*|linux*)
    alias ls="ls --color"
    ;;
esac


# terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# Attache tmux
case "${OSTYPE}" in
darwin*)
    if [ -z "$TMUX" -a -z "$STY" ]; then
        if type tmuxx >/dev/null 2>&1; then
            tmuxx
        elif type tmux >/dev/null 2>&1; then
            if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
                tmux attach && echo "tmux attached session "
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
    ;;
esac

# load user .zshrc configuration file
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

# load rbenv
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

# load perlbrew
[ -f ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc

# load pyenv
eval "$(pyenv init -)"

# Agent forward setting
case "${OSTYPE}" in
darwin*)
    ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
    ;;
esac

PERL_MB_OPT="--install_base \"/Users/hirano/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/hirano/perl5"; export PERL_MM_OPT;

[ -f ${HOME}/google-cloud-sdk/completion.zsh.inc ] && source $HOME/google-cloud-sdk/completion.zsh.inc
[ -f ${HOME}/google-cloud-sdk/path.zsh.inc ] && source $HOME/google-cloud-sdk/path.zsh.inc


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Cloud sdk settings
case "${OSTYPE}" in
darwin*)
    [ -f ~/depot/google-cloud-sdk/completion.zsh.inc ] && source ~/depot/google-cloud-sdk/completion.zsh.inc
    [ -f ~/depot/google-cloud-sdk/path.zsh.inc ] && source ~/depot/google-cloud-sdk/path.zsh.inc
    ;;
esac

