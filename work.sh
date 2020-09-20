autoload -Uz vcs_info
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~}${vcs_info_msg_0_} > '
