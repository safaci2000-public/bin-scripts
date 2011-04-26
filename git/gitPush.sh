#!/bin/bash
BRANCHES=$(git remote show)
SANDBOX=work
git stash 
git checkout master
git merge $SANDBOX
for i in $BRANCHES; 
do
    git push $i master:master
    git push --tags $i
done
git checkout $SANDBOX
