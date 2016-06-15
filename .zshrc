# zplug init
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

setopt prompt_subst

# zplug plugins
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug 'themes/wedisagree', from:oh-my-zsh

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

