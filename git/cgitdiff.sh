#!/bin/bash
echo WARNING: a more intelligent way of doing this is using gitconfig ..but this is a simple pretty hack.

echo diff hash: $1
git diff $1 | colordiff | less -R 
