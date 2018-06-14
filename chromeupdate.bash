#!/usr/bin/env bash

# To completely remove your existing Chrome app on OS X and install a specific
# version that will not automatically update:
# 1.  Remove the app from the "Applications" folder.
# 2.  rm -rf "~/Library/Application Support/Google/Chrome"
# 3.  rm -rf ~/Library/Google/GoogleSoftwareUpdate
# 4.  Install your new version of Chrome.
# 5.  Run Chrome for the first time in order to let it perform 1-time installation tasks.
# 6.  Quit Chrome.
# 7.  Run this script and disable automatic updates

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

echo "1. Enable Chrome automatic updates"
echo "2. Disable Chrome automatic updates"

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

