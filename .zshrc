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

zplug 'themes/wedisagree', from:oh-my-zsh

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
alias ls="ls -F --color"
# }}}

# PATH {{{
export EDITOR=/user/bin/vim
export PATH="$HOME/anaconda3/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# CUDA
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64
# }}}
