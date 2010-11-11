autoload -U compinit promptinit compinit
promptinit
setopt COMPLETE_IN_WORD

set -o vi
prompt zefram
#export RPROMPT="%{$fg[green]%}%m:%~%{$reset_color%}"
#export RPROMPT="%{\e[0;31m%}%m%{\e[0m%}"
#RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT ($PR_YELLOW%D{%a,%b%d}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'
#RPROMPT=$'\e[0;31m$ \e[0m'
autoload -U colors && colors
export RPROMPT="%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
#export PS1='%n %! %%> '
#export PS1='%n %{$fg[yellow]%}%D{%a, %b%d} %{$reset_color%}% %%> '
#%K{white}%F{red}%(?..(%?%))%K{black}%F{white}%B%(2L.+.)%(1j.[%j].)%F{yellow}%(t.Ding!.%D{%L:%M})%f%k%b%#
export PS1='%n %{$fg[yellow]%}%D{%H:%M.%S} %{$reset_color%}% %! %%> '
# Created by newuser for 4.3.9
source ~/.aliases  ## Generic aliases
source ~/.localaliases  ## Machine dependent aliases

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
