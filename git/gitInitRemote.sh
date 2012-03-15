#!/bin/bash
usage()
{
    echo "usage $0 [options] "
    echo "        -H               remote hostname"
    echo "        -m               project name"
    echo "        -h               This message"
    echo "        -d               Project Description"
    exit $1
}


sanityCheck()
{
    if  test  "${HOST:+1}"; then
        echo "" >> /dev/null
    else
        echo "err:: HOST is not set"
        usage 1
    fi


    if  test  "${PROJECT:+1}"; then
        echo "" >> /dev/null
    else
        echo "err::  PROJECT is not set"
        usage 1
    fi

    if  test  "${DESCRIPTION:+1}"; then
        echo "" >> /dev/null
    else
        echo "warn:  DESCRIPTION is not set"
        DESCRIPTION="project description is undefined" 
        usage 1 
    fi

}

main()
{

ssh $HOST "cd /var/git/repositories/; mkdir $PROJECT.git; cd $PROJECT.git; git init --bare; echo $DESCRIPTION > description"

}

while getopts 'H:m:d:h' arg; do
    case "${arg}" in
        H) HOST="${OPTARG}" ;;
        m) PROJECT="${OPTARG}" ;;
        d) DESCRIPTION="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

sanityCheck
main

