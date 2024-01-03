#!/bin/bash
git clone "git@github.com:pringon/$1.git" "$2"
cd "$2" || exit
rm -rf .git
sed -i -e "s|PROJECT_NAME|$2|g" ./package.json
