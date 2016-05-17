#!/bin/bash

echo “Deploying to github pages…”
#generate static version in public
hugo

#move into public git submodule and add changes
cd public
git add -A

#commit changes with optional message from args
msg = “rebuilding site `date`”
if [ $# -eq 1]
	then msg = “$1”
fi
git commit -m “$msg”

git push origin master

cd ..

