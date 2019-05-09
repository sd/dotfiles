# Customization of the precmd and preexec functions provided by lib/termsupport.zsh

DISABLE_AUTO_TITLE=true

SD_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
SD_THEME_TERM_TITLE_IDLE="%n@%m: %~"

# Runs before showing the prompt
function sd_termsupport_precmd {
  emulate -L zsh

  title $(basename $PWD) $ZSH_THEME_TERM_TITLE_IDLE
}

# Runs before executing the command
function sd_termsupport_preexec {
  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local SHORT="$(basename $PWD) • ${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}"
  local LONG="$ZSH_THEME_TERM_TITLE_IDLE • ${1:gs/%/%%}"

  title '$SHORT' '%100>...>$LONG%<<'
}

precmd_functions+=(sd_termsupport_precmd)
preexec_functions+=(sd_termsupport_preexec)
