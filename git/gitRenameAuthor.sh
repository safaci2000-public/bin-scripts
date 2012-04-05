#!/usr/bin/zsh


usage()
{
    echo "usage ${APPNAME} [options] command <command options>"
    echo " general options:"
    echo "    -u               current user's name"
    echo "    -e               current user's email"
    echo "    -U               new user's name"
    echo "    -E               new user's email"
    echo "    -h               Help message"
    exit $1
}

doSanityCheck()
{

   if  test  "${OUSER:+1}"; then
       echo "OUSER: ${OUSER}"
   else
       echo "ERROR: OUSER is not set"
       usage 1
   fi

   if  test  "${NUSER:+1}"; then
       echo "NUSER: ${NUSER}"
   else
       echo "ERROR: NUSER is not set"
       usage 1
   fi

   if  test  "${OEMAIL:+1}"; then
       echo "OEMAIL: ${OEMAIL}"
   else
       echo "ERROR: OEMAIL is not set"
       usage 1
   fi

   if  test  "${NEMAIL:+1}"; then
       echo "NEMAIL: ${NEMAIL}"
   else
       echo "ERROR: NEMAIL is not set"
       usage 1
   fi

}

main()
{

    cmd="git filter-branch --commit-filter \"
            if [ \"${GIT_COMMITTER_NAME}\" = \"${OEMAIL}\" ];
            then
                    GIT_COMMITTER_NAME=\"${NUSER}\";
                    GIT_AUTHOR_NAME=\"${NUSER}\";
                    GIT_COMMITTER_EMAIL=\"${NEMAIL}\";
                    GIT_AUTHOR_EMAIL=\"${NEMAIL}\";
                    git commit-tree \"$@\";
            else
                    git commit-tree \"$@\";
            fi\" HEAD "

    echo $cmd

    git filter-branch --env-filter "
        an=\"$GIT_AUTHOR_NAME\"
        am=\"$GIT_AUTHOR_EMAIL\"
        cn=\"$GIT_COMMITTER_NAME\"
        cm=\"$GIT_COMMITTER_EMAIL\"
    
   
    if [ \"$GIT_COMMITTER_EMAIL\" = \"${OEMAIL}\" ]
    then
        cn=\"${NUSER}\"
        cm=\"${NEMAIL}\"
    fi
    if [ \"$GIT_AUTHOR_EMAIL\" = \"${OEMAIL}\" ]
    then
        an=\"${NUSER}\"
        am=\"${NEMAIL}\"
    fi
    
    export GIT_AUTHOR_NAME=\"$an\"
    export GIT_AUTHOR_EMAIL=\"$am\"
    export GIT_COMMITTER_NAME=\"$cn\"
    export GIT_COMMITTER_EMAIL=\"$cm\"
    "


}

while getopts 'u:e:U:E:h' arg; do
    case "${arg}" in
        u) OUSER="${OPTARG}" ;;
        e) OEMAIL="${OPTARG}" ;;
        U) NUSER="${OPTARG}" ;;
        E) NEMAIL="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

doSanityCheck
main
