#!/bin/bash
ssh $1 "cd /var/git/repositories/; mkdir $2.git; cd $2.git; git init --bare"
