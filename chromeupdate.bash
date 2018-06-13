#!/usr/bin/env bash

# Taken from this page:
# https://discussions.apple.com/thread/7812708

# The normal group and user that will allow autoupdate to work.
normalGroup=`stat -f "%Sg" ~`
normalUser=`stat -f "%Su" ~`

# The group and user that will deny autoupdate from working.
# The article says to set the group to "nogroup" but that group does not usually exist, so it has no effect.
deniedGroup="$normalGroup"
deniedUser="nobody"

# Normal permissions on this directory are "drwxr-xr-x" (achieved with "chmod 0755")
updateFolder="~/Library/Google/GoogleSoftwareUpdate/"

echo "1. Enable Chrome autoupdate"
echo "2. Disable Chrome autoupdate"

read commandNum

if [ $commandNum = "1" ]
then
    cmd="sudo chown $normalUser:$normalGroup $updateFolder"
    eval $cmd
    cmd="sudo chmod 0755 $updateFolder"
    eval $cmd
elif [ $commandNum = "2" ]
then
    cmd="sudo chown $deniedUser:$deniedGroup $updateFolder"
    eval $cmd
    cmd="sudo chmod 000 $updateFolder"
    eval $cmd
fi

