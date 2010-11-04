autoload -U compinit promptinit
compinit
promptinit
setopt COMPLETE_IN_WORD

set -o vi
prompt zefram
export RPROMPT="%{$fg[green]%}%~%{$reset_color%}"
export PS1='%n@%m %! %%> '
# Created by newuser for 4.3.9
source ~/.aliases  ## Generic aliases
source ~/.localaliases  ## Machine dependent aliases

## vim mode
autoload -Uz edit-command-line
zle -N edit-command-line 
bindkey -M vicmd 'v' edit-command-line

export TARGET=TEST
export PATH=/Developer/bin:$PATH
