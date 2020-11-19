#!/bin/bash

engine=$1
testCommand=$2
branch=`git rev-parse --abbrev-ref HEAD`


echo "Circle compare URL"
echo $CIRCLE_COMPARE_URL
echo "Circle compare URL - end"

if [ "$branch" = "master" ]; then
  echo "YES, IT'S MASTER!!"
  eval $testCommand
elif git diff --name-only $PREVIOUS_COMMIT...$NEW_COMMIT  | grep "^${engine}" ; then
  echo "YES, THIS FOLDER IS BEING MODIFIED"

  eval $testCommand
else
  echo "NO"
fi
