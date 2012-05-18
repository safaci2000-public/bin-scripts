#!/bin/bash
git show --pretty="format:" --name-only $1 | sed -e '/^$/d'
