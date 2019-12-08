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

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3

typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'

# peco {{{
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
# }}}

# smart change directory
zplug "b4b4r07/enhancd", use:init.sh

# Prompt {{{
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
autoload -Uz terminfo

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
left_down_prompt_preexec() {
    print -rn -- $terminfo[el]
}
add-zsh-hook preexec left_down_prompt_preexec

function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
            ;;
        vicmd)
            PROMPT_2="$fg[white]-- NORMAL --$reset_color"
            ;;
        vivis|vivli)
            PROMPT_2="$fg[yellow]-- VISUAL --$reset_color"
            ;;
    esac

    PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}[%(?.%{${fg[green]}%}.%{${fg[red]}%})%n@%m%{${reset_color}%}]\$ "
    RPROMPT=$WHITE'[%~]'$DEFAULT
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line
# }}}

# dircolors {{{
zplug "seebi/dircolors-solarized"
DIR_COLORS_F=~/.zplug/repos/seebi/dircolors-solarized/dircolors.ansi-light
echo $DIR_COLORS_F
if [ -f $DIR_COLORS_F ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors $DIR_COLORS_F)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors $DIR_COLORS_F)
    fi
fi
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

case ${OSTYPE} in
    darwin*)
        alias ls="gls --color=auto"
        ;;
    linux*)
        alias ls="ls -F --color"
        ;;
esac
alias l='ls'
# }}}

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

alias vim="nvim"
alias vi="nvim"
# }}}

# PATH {{{
export EDITOR=/usr/bin/vim
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="/Users/jonki/go"

# CUDA
#export CUDA_HOME=/usr/local/cuda
#export PATH=$PATH:$CUDA_HOME/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64
# }}}

# bind keys {{{
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M vicmd '^A'  beginning-of-line
bindkey -M vicmd '^E'  end-of-line

bindkey -M viins '^N'  down-history
bindkey -M viins '^P'  up-history

# text-object {{{
# https://qiita.com/ToruIwashita/items/eaefada1346e97d09fdb
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround
# }}}
# }}}
