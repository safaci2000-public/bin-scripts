autoload -U compinit promptinit compinit
promptinit
setopt COMPLETE_IN_WORD

set -o vi
prompt zefram
autoload -U colors && colors
export RPROMPT="%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
export PS1='%n %{$fg[yellow]%}%D{%H:%M.%S} %{$reset_color%}% %! %%> '

source ~/.aliases  ## Generic aliases
source ~/.localaliases  ## Machine dependent aliases, that can override .aliases

## vim mode
autoload -Uz edit-command-line
zle -N edit-command-line 
bindkey -M vicmd 'v' edit-command-line

export TARGET=TEST
export PATH=/Developer/bin:$PATH
export PATH=$PATH:$HOME/bin/private
alias -g BR='>& /dev/null &|'

##single path operation, lets me add/restore a single extra path.
addPath()
{
    export OLDPATH=$PATH
    export PATH=$PATH:$PWD
}

resPath()
{
    export PATH=$OLDPATH

}

## if adding multiple $PATH, save state lets you restore from one past point in history.
saveState()
{
    export PATHSTATE=$PATH
}

resState()
{
    export PATH=$PATHSTATE

} 

cdg()
{
    cd $1/$1-git
}
