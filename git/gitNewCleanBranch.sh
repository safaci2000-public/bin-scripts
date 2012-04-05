#!/bin/bash
git symbolic-ref HEAD refs/heads/$1
rm .git/index 
git clean -fdx 
