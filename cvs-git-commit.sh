#!/bin/bash
cd ..
repo_location=$(pwd)
echo $repo_location
res=$( echo $repo_location |awk -F /  '{print $NF}'  )
echo $res
echo "What is the git hash ID you wish to commit? " 
read githash
echo $githash
cd $res-git; git cvsexportcommit -c -p -v -w  $repo_location/$res-cvs $githash
