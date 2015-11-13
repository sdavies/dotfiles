# .bashrc
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="/usr/local/heroku/bin:$HOME/Android/Sdk/platform-tools:$HOME/.local/bin:$HOME/bin:$HOME/.rbenv/bin:$PATH:"
eval "$(rbenv init -)"


powerline-daemon -q
powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [[ "$powerline_path" != "" ]]; then
  source ${powerline_path}/bindings/bash/powerline.sh
fi

export QMAKE=/usr/bin/qmake-qt4

export EDITOR=vim
export PSQL_EDITOR='vim +"set syntax=sql" '

export PGHOST=127.0.0.1
export PGPORT=5432
export PGUSER=sdavies
export PGPASSFILE=~/.pgpass
export PGSSLMODE=prefer
export PGDATESTYLE=ISO
export PGTZ=America/Vancouver
export PGCLIENTENCODING=UTF8

# some more ls aliases
#alias ll='ls -alF'
alias vi='vimx'
alias vim='vimx'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias whatismyip='curl ip.appspot.com'
alias npm-exec='PATH=$(npm bin):$PATH'
alias git-top='cd $(git topdir)'

function dockerip(){
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${1}
}

set -o vi
