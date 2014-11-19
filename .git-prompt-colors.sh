local Time12a="\$(date +%H:%M)"
local PathShort="\u@\h \W"

GREEN="\[\033[38;5;02m\]"
BRIGHTGREEN="\[\033[38;5;10m\]"
BLUE="\[\033[38;5;39m\]"
CYAN="\[\033[38;5;06m\]"
ORANGE="\[\033[38;5;202m\]"
RED="\[\033[38;5;09m\]"
YELLOW="\[\033[38;5;03m\]"

# These are the color definitions used by gitprompt.sh
GIT_PROMPT_PREFIX="("                 # start of the git info string
GIT_PROMPT_SUFFIX=")"                 # the end of the git info string
GIT_PROMPT_SEPARATOR="|"              # separates each item

#GIT_PROMPT_BRANCH="${Magenta}"        # the git branch that is active in the current directory
GIT_PROMPT_BRANCH="${ORANGE}"        # the git branch that is active in the current directory
GIT_PROMPT_STAGED="${YELLOW}●"           # the number of staged files/directories
GIT_PROMPT_CONFLICTS="${RED}✖"        # the number of files in conflict
GIT_PROMPT_CHANGED="${GREEN}✚"         # the number of changed files

GIT_PROMPT_REMOTE=" "                 # the remote branch name (if any) and the symbols for ahead and behind
GIT_PROMPT_UNTRACKED="${CYAN}…"       # the number of untracked files/dirs
GIT_PROMPT_STASHED="${BLUE}⚑"     # the number of stashed files/dir
GIT_PROMPT_CLEAN="${BRIGHTGREEN}✔"      # a colored flag indicating a "clean" repo

GIT_PROMPT_COMMAND_OK="${Green}✔ "    # indicator if the last command returned with an exit code of 0
GIT_PROMPT_COMMAND_FAIL="${Red}✘ "   # indicator if the last command returned with an exit code of other than 0

GIT_PROMPT_START_USER="[${PathShort}${ResetColor}"
GIT_PROMPT_START_ROOT="[${PathShort}${ResetColor}"
GIT_PROMPT_END_USER="${White}${ResetColor}]$ "
GIT_PROMPT_END_ROOT="${White}${ResetColor}]# "

# Please do not add colors to these symbols
GIT_PROMPT_SYMBOLS_AHEAD="↑·"         # The symbol for "n versions ahead of origin"
GIT_PROMPT_SYMBOLS_BEHIND="↓·"        # The symbol for "n versions behind of origin"
GIT_PROMPT_SYMBOLS_PREHASH=":"        # Written before hash of commit, if no name could be found
