#!/bin/bash
BRANCHES=$(git remote show)
SANDBOX=work
echo "WARNING stashing clearing in 5 seconds...."
sleep 5
#git stash  clear
#git stash
git checkout master
git merge $SANDBOX
for i in $BRANCHES; 
do
    git push $i master:master
    git push --tags $i
done
git checkout $SANDBOX
#git stash apply
