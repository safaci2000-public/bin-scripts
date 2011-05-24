unset __CURRENT_GIT_BRANCH
unset __CURRENT_GIT_BRANCH_STATUS
unset __CURRENT_GIT_BRANCH_IS_DIRTY

local st="$(git status 2>/dev/null)"
if [[ -n "$st" ]]; then
    local -a arr
    arr=(${(f)st})

    if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
        __CURRENT_GIT_BRANCH='no-branch'
    else
        __CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
    fi

    if [[ $arr[2] =~ 'Your branch is' ]]; then
        if [[ $arr[2] =~ 'ahead' ]]; then
            __CURRENT_GIT_BRANCH_STATUS='ahead'
        elif [[ $arr[2] =~ 'diverged' ]]; then
            __CURRENT_GIT_BRANCH_STATUS='diverged'
        else
            __CURRENT_GIT_BRANCH_STATUS='behind'
        fi
    fi

    if [[ ! $st =~ 'nothing to commit' ]]; then
        __CURRENT_GIT_BRANCH_IS_DIRTY='1'
    fi
fi


if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    local s="("
    s+="$__CURRENT_GIT_BRANCH"
    case "$__CURRENT_GIT_BRANCH_STATUS" in
        ahead)
        s+="↑"
        ;;
        diverged)
        s+="↕"
        ;;
        behind)
        s+="↓"
        ;;
    esac
    if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
        s+="⚡"
    fi
    s+=")"
 
    printf " %s%s" "%{${fg[yellow]}%}" $s
fi

case "$1" in 
    git*)
    __EXECUTED_GIT_COMMAND=1
    ;;
esac

if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars
    unset __EXECUTED_GIT_COMMAND
fi


