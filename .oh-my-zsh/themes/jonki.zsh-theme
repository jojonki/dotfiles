PROMPT='▶ '
#PROMPT='%{$fg[green]%} ▶ '
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
# RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}%m%{$reset_color%}'
#RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$reset_color%}'
RPS1='%{$fg[white]%}%~$(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡%{$fg[green]%}"

export LSCOLORS="exfxcxdxbxegedabagacad"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
