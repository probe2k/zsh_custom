autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %F{51}%b%f '

setopt PROMPT_SUBST
PROMPT='%B${vcs_info_msg_0_}%b%(!.%F{yellow}%B%~%b %F{red}%B#%b%f .%F{yellow}%B%~%b %F{blue}❯ %f)'
