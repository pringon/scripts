#!/bin/bash

git clone "git@github.com:pringon/$1.git"
mv  "$1" "$2"
cd "$2"
git remote remove origin
