typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
setopt prompt_subst

zsh_git_compute_vars() 
{
    export __CURRENT_GIT_BRANCH="$(parse_git_branch)"
    export __CURRENT_GIT_VARS_INVALID=
}

parse_git_branch() 
{
    git branch --no-color 2> /dev/null  | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

zsh_git_chpwd_update_vars() 
{
    RPROMPT="$(get_git_prompt_info)%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
}


chpwd_functions+='zsh_git_chpwd_update_vars'

preexec_functions+='zsh_git_preexec_update_vars'

##This is dumb.. i'm running this 
zsh_git_preexec_update_vars() 
{
    case "$(history -1)" in 
        *git*)
            #RPROMPT="$(get_git_prompt_info)%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
            ;;
    esac
}

get_git_prompt_info() 
{
    test -n "$__CURRENT_GIT_VARS_INVALID" && zsh_git_compute_vars
    echo $__CURRENT_GIT_BRANCH
}

RPROMPT="$(get_git_prompt_info)%{$fg[red]%}%m:%{$fg[green]%}%~ %{$reset_color%}%"
#PROMPT='%c$(get_git_prompt_info) %% '
#RPROMPT='$(get_git_prompt_info)'

