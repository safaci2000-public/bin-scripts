#!/bin/bash
usage()
{
    echo "usage $0 [options] "
    echo "        -H               remote hostname"
    echo "        -m               project name"
    echo "        -h               This message"
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
}

main()
{

if [ $# -ne 2 ]; then
    echo "please user the format $(basename $0) hostname reponame"
    exit 1;
fi
ssh $HOST "cd /var/git/repositories/; mkdir $PROJECT.git; cd $PROJECT.git; git init --bare"

}

while getopts 'H:m:h' arg; do
    case "${arg}" in
        H) HOST="${OPTARG}" ;;
        m) PROJECT="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

sanityCheck
main

