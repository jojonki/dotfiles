# zplug settings {{{

# zplug init
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

setopt prompt_subst

# command compleitions
zplug "zsh-users/zsh-completions"

# color 
zplug "zsh-users/zsh-syntax-highlighting"
typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'

# zplug 'themes/wedisagree', from:oh-my-zsh
# Hecomi Terminal Appearance {{{

# Color
local gray=$'%{\e[0;30m%}'
local red=$'%{\e[0;31m%}'
local green=$'%{\e[0;32m%}'
local yellow=$'%{\e[0;33m%}'
local blue=$'%{\e[0;34m%}'
local purple=$'%{\e[0;35m%}'
local light_blue=$'%{\e[0;36m%}'
local white=$'%{\e[0;37m%}'
local GRAY=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local PURPLE=$'%{\e[1;35m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$white

# Prompt
local HOSTC=$GREEN
case ${HOST} in
hecom)
	HOSTC=$PURPLE
	;;
*)
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
		HOSTC=$YELLOW
	;;
esac
PROMPT=$HOSTC'${USER}'$RED'@'$HOSTC'${HOST}'$RED'%(!.#.$) '$DEFAULT
PROMPT2=$blue'%_> '$DEFAULT
RPROMPT=$WHITE'[%~]'$DEFAULT
SPROMPT=$BLUE'correct: '$WHITE'%R'$BLUE' -> '$YELLOW'%r'$BLUE' [nyae]? '$DEFAULT
setopt PROMPT_SUBST
# }}}

# smart change directory
zplug "b4b4r07/enhancd", use:init.sh

# peco
zplug "peco/peco", as:command
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
if [ -x "`which peco`" ]; then
  alias ll='ls -la | peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load --verbose
# }}}

# history {{{
export HISTFILE=${HOME}/.zsh_history
# in memory
export HISTSIZE=1000
# in file
export SAVEHIST=100000
# not save duplicate commands
# setopt hist_ignore_dups
# save start開始と終了を記録
# Save each command’s beginning timestamp and the duration to the history file
setopt EXTENDED_HISTORY
# share histories between panes/windows
setopt inc_append_history

# aliases
alias h="history"
alias history="history -i"
# }}}

# other aliases {{{
alias vim="nvim"
alias vi="nvim"
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias l="ls"
# }}}

# PATH {{{
export EDITOR=/usr/bin/vim
export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="/Users/jonki/go"

# CUDA
#export CUDA_HOME=/usr/local/cuda
#export PATH=$PATH:$CUDA_HOME/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64
# }}}

# bind keys {{{
# to avoid overriding problem of oh-my-zsh
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
# }}}

# google cloud {{{
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/work/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/work/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/work/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/work/google-cloud-sdk/completion.zsh.inc"; fi
# }}}
