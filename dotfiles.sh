#!/usr/bin/env sh

# Create variable to hold the absolute path to this script
# Absolute path of the script e.g., /home/.config/dotfiles
SCRIPT=$(readlink -f "$0")
# Extract just the directory
SCRIPT_PATH=$(dirname "$SCRIPT")
# echo $SCRIPT_PATH # DELETE ME

# Switch to the script directory
cd $SCRIPT_PATH
if ! [ -d "user-home" ]
then
    echo "Did not find directory 'user-home'."
    echo "Aborting script"
    exit 1
fi

# Get the list of items that we want to create links for
LIST="$(find $PWD/user-home/ \
            -iname '.*' \
            -type f \
            -printf "%f\n" )"
cd user-home
for f in $LIST; do
    $ORIG=$(echo "$HOME/$f")
    echo "\$ORIG = $ORIG"
    $REPO=`echo "$PWD/$f"`
    if [ -L "$HOME/$f" ]
    then
       if [ "$HOME/$f" -ef "$f" ]
       then
           echo "$f: Already linked"
       else
           echo "$f: Is linked to a different location. Delete the link and rerun this script."
       fi
    fi
#   if [ -f "$HOME/$f" ]
    #stat --printf="%s" $f
    echo ""
done

# Make sure the files in home are not links
# Move the originals to the backup folder
# Create links in $HOME to the files in the git folder
