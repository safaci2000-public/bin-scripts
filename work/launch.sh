#!/bin/bash
BRANCH=BR_NTR_15_APR
(cd ~/work/$BRANCH; git stash clear; git stash ; git checkout sandbox; git fetch origin;  git merge origin/sandbox; cd app/main ; ant debug)
