#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "error: requires name of new branch"
    echo "usage:  $0 <branchName>"
    exit 1
fi

git symbolic-ref HEAD refs/heads/$1
rm .git/index 
git clean -fdx 
