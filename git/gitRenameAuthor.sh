#!/usr/bin/zsh


usage()
{
    echo "usage ${APPNAME} [options] command <command options>"
    echo " general options:"
    echo "    -o               current user's email"
    echo "    -u               new user's name"
    echo "    -e               new user's email"
    echo "    -h               Help message"
    exit $1
}

doSanityCheck()
{

   if  test  "${NEWUSER:+1}"; then
       echo "NEWUSER: ${NEWUSER}"
   else
       echo "ERROR: NEWUSER is not set"
       usage 1
   fi

   if  test  "${OLDEMAIL:+1}"; then
       echo "OLDEMAIL: ${OLDEMAIL}"
   else
       echo "ERROR: OLDEMAIL is not set"
       usage 1
   fi

   if  test  "${NEWEMAIL:+1}"; then
       echo "NEWEMAIL: ${NEWEMAIL}"
   else
       echo "ERROR: NEWEMAIL is not set"
       usage 1
   fi

}

main()
{

    #cmd="git filter-branch --commit-filter \"
    #        if [ \"${GIT_COMMITTER_NAME}\" = \"${OLDEMAIL}\" ];
    #        then
    #                GIT_COMMITTER_NAME=\"${NEWUSER}\";
    #                GIT_AUTHOR_NAME=\"${NEWUSER}\";
    #                GIT_COMMITTER_EMAIL=\"${NEWEMAIL}\";
    #                GIT_AUTHOR_EMAIL=\"${NEWEMAIL}\";
    #                git commit-tree \"$@\";
    #        else
    #                git commit-tree \"$@\";
    #        fi\" HEAD "

    #echo $cmd

    git filter-branch --env-filter "
        an=\"$GIT_AUTHOR_NAME\"
        am=\"$GIT_AUTHOR_EMAIL\"
        cn=\"$GIT_COMMITTER_NAME\"
        cm=\"$GIT_COMMITTER_EMAIL\"

        echo $an 
        echo $am
        echo $cn
        echo $cm
    
   
    if [ \"$GIT_COMMITTER_EMAIL\" = \"${OLDEMAIL}\" ]
    then
        cn=\"${NEWUSER}\"
        cm=\"${NEWEMAIL}\"
    fi
    if [ \"$GIT_AUTHOR_EMAIL\" = \"${OLDEMAIL}\" ]
    then
        an=\"${NEWUSER}\"
        am=\"${NEWEMAIL}\"
    fi
    
    export GIT_AUTHOR_NAME=\"$an\"
    export GIT_AUTHOR_EMAIL=\"$am\"
    export GIT_COMMITTER_NAME=\"$cn\"
    export GIT_COMMITTER_EMAIL=\"$cm\"
    "


}

while getopts 'o:u:e:h' arg; do
    case "${arg}" in
        o) OLDEMAIL="${OPTARG}" ;;
        u) NEWUSER="${OPTARG}" ;;
        e) NEWEMAIL="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

doSanityCheck
main
