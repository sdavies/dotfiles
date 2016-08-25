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
export PATH="/usr/local/heroku/bin:$HOME/Android/Sdk/platform-tools:$HOME/.local/bin:$HOME/bin:$HOME/.rbenv/bin:$PATH:$HOME/android-studio/bin/:"
eval "$(rbenv init -)"

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Custom
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
source ~/.bash-git-prompt/gitprompt.sh

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
export HISTTIMEFORMAT="%y/%m/%d %T "

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source '/home/sdavies/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/sdavies/google-cloud-sdk/completion.bash.inc'

# added by travis gem
[ -f /home/sdavies/.travis/travis.sh ] && source /home/sdavies/.travis/travis.sh
