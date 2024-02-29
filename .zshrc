# PROMPT='%F{blue}%~%f'$'\n''%(!.%F{red}# .%F{green}❯ )%f'
# PROMPT='%(?.%F{green}.%F{red}) %(!.%F{red}%n.%F{green}%n)%f %F{yellow}%~%f '
# PROMPT='%(?.%F{green}.%F{red}) %B%(!.%F{red}%n.%F{117}%n)%f %F{214}%~%f%b '

setopt PROMPT_SUBST

git_prompt_info() {
    local branch_name dirty_status
    branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    dirty_status=$(git diff --shortstat 2>/dev/null)

    if [ -n "$branch_name" ]; then
        echo "%F{green}%f %F{81}$branch_name${dirty_status:+*}%f"
    fi
}

PROMPT='%(?.%F{green}✔ .%F{red}✘ ) %B%F{117}ヤッ %f%b%F{blue}%f %F{228}%B%~%f %F{141}$(git_prompt_info)%f%b%f'$'\n''%(!.%F{red}%B󰚌%b .%F{green}%B󰊠%b )%f '

alias ls='ls --color=auto'
alias ip='ip -c'
alias t='tmux'
alias grep='grep --color=auto'
alias cat='bat -f '
# alias scr='ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'
# alias scra='ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -f alsa -i default -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'
alias hs='nmcli device wifi hotspot ifname wlp3s0 band bg ssid Hotspot password inspiron'

source /home/probe/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/probe/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

HISTSIZE=100000
HISTFILESIZE=2000000
HISTFILE=/home/probe/.config/zsh/zsh_history
SAVEHIST=100000

precmd() {
	precmd() {
		echo
	}
}

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi

# If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# Otherwise start tmux
# [[ -z "$TMUX" ]] && exec tmux

# if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi

## conda setup
#__conda_setup="$('/home/probe/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/probe/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/probe/anaconda3/etc/profile.d/conda.sh"
#    else
#        export path="/home/probe/anaconda3/bin:$path"
#    fi
#fi
#unset __conda_setup
