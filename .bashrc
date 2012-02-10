# .bashrc

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

HISTCONTROL=ignoredups:ignorespace

shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# User specific aliases and functions
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

fi


export EDITOR=vim
export PSQL_EDITOR='vim +"set syntax=sql" '

export PGHOST=127.0.0.1
export PGPORT=5432
export PGUSER=domain7
export PGPASSFILE=~/.pgpass
export PGSSLMODE=prefer
export PGDATESTYLE=ISO
export PGTZ=America/Vancouver
export PGCLIENTENCODING=UTF8
#PGSERVICE
#PGSYSCONFDIR

export OPSCODE_USER=shanedavies

git-top(){
	top=$(git rev-parse --show-toplevel)
	if [ 0 -eq $? ]; then
		cd $top
	fi
}
