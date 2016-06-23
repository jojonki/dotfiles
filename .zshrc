# zplug init
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

setopt prompt_subst

# zplug plugins
zplug "mollifier/anyframe"
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# smart change directory
zplug "b4b4r07/enhancd", use:init.sh

# color theme
zplug 'themes/wedisagree', from:oh-my-zsh

# fzf-bin にホスティングされているので注意
# またファイル名が fzf-bin となっているので file:fzf としてリネームする
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
# zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "peco/peco",          as:command, from:gh-r
# search history
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | eval $tac | peco)
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


# directory colorize
zplug "joel-porquet/zsh-dircolors-solarized"

# prepare a symbolic link before this task
# ln -s ~/.zplug/repos/seebi/dircolors-solarized/dircolors.ansi-light ~/.dircolors 
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias l="ls"
alias ls="ls -F --color"

# Then, source packages and add commands to $PATH
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

HISTSIZE=50000
alias h="history"
alias history="history -i"

zplug load --verbose


