# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

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

alias whatismyip='curl ip.appspot.com'
#alias gpw="apg -n20 -m20 -MNCLS -p7 -a1 -E \\\/\\\`\>\<\\\"\'\\\\ -b ~/bloomfile -r /usr/share/dict/words"
alias gpw="apg -n20 -m20 -MNCLS -p7 -a1 -E \\\/\\\`\>\<\\\"\'\\\\ -r /usr/share/dict/words"
alias rails="bundle exec rails"
alias specjour="bundle exec specjour"
alias rspec="bundle exec rspec"
alias rake="bundle exec rake"
alias pickler="bundle exec pickler"
alias guard="bundle exec guard"
alias knife="bundle exec knife"
alias cucumber="bundle exec cucumber"

#heroku
export PATH="/usr/local/heroku/bin:$PATH"
#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

set -o vi

export CHROME_DEVEL_SANDBOX=~/chrome-linux/chrome_sandbox