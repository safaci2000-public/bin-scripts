#!/bin/bash
usage()
{
    echo "usage $0 [options] "
    echo "        -m               project name/location"
    echo "        -h               This message"
    exit $1
}

sanityCheck()
{

    if  test  "${PROJECT:+1}"; then
        echo "" >> /dev/null
    else
        echo "err::  PROJECT is not set"
        usage 1
    fi
}

main()
{

    scp -p -P 29418 $USER@gerrit.corp.nextag.com:hooks/commit-msg $PROJECT/.git/hooks/

}

while getopts 'm:h' arg; do
    case "${arg}" in
        m) PROJECT="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

sanityCheck
main
