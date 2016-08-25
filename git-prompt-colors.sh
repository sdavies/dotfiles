override_git_prompt_colors() {
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_SHOW_UNTRACKED_FILES=no
  GIT_PROMPT_BRANCH="${Cyan}"
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_STAGED="${Yellow}●"
  GIT_PROMPT_CHANGED="${Green}✚ "
  GIT_PROMPT_START_USER="${Cyan}[${Blue}\\u@\\h ${Green}\\W${Cyan}]_LAST_COMMAND_INDICATOR_"
  GIT_PROMPT_START_ROOT="${Cyan}[${BoldRed}\\u@${Red}\\h ${Green}\\W${Cyan}] "
  GIT_PROMPT_END_USER="${ResetColor} $ "
  GIT_PROMPT_END_ROOT="${ResetColor} # "
}

reload_git_prompt_colors "Custom"
