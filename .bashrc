# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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

# Terminals with any of the following set, support 256 colors (and are local)
local256="$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION"

if [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then
  case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
  esac
  export TERM

  if [ -n "$TERMCAP" ] && [ "$TERM" = "screen-256color" ]; then
    TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    export TERMCAP
  fi
fi

unset local256


alias whatismyip='curl ip.appspot.com'
#alias gpw="apg -n20 -m20 -MNCLS -p7 -a1 -E \\\/\\\`\>\<\\\"\'\\\\ -b ~/bloomfile -r /usr/share/dict/words"
alias gpw="apg -n20 -m20 -MNCLS -p7 -a1 -E \\\/\\\`\>\<\\\"\'\\\\ -r /usr/share/dict/words"
