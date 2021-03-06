PROMPT='%(!.%F{yellow}%B%~%b %F{red}%B#%b%f .%F{yellow}%B%~%b %F{blue}❯ %f)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias emu='/home/probe/Android/Sdk/emulator -avd Pixel_4 -qemu --enable-kvm'
alias scr='ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'
alias scra='ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -f alsa -i default -preset ultrafast "/home/probe/rec_`date +%b-%d-%I:%M:%S`.mp4"'

source /home/probe/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/probe/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

HISTSIZE=100000
HISTFILESIZE=2000000
HISTFILE=/home/probe/.zsh/zsh_history
SAVEHIST=100000

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

