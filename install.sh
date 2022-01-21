#!/bin/bash

# This script will replace the contents of the fish configuration folder with
# symlinks to the contents of this project.

FISH_HOME="$HOME/.config/fish"
FOLDERS_TO_LINK=("completions" "conf.d" "functions" "src")

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NO_FISH_FOUND_MSG="No fish installation found.
Is this your fish config directory: $FISH_HOME?"
REMOVE_EXISTING_FISH_MSG="WARNING: This will clear out your current fish
config folder ($FISH_HOME).

Press ENTER to continue or CTRL-C to exit..."

# check for fish configuration directory
if [ ! -d "$FISH_HOME" ]; then
  echo "$NO_FISH_FOUND_MSG"
  exit 1
fi

# clear out existing symlinks
read -p "$REMOVE_EXISTING_FISH_MSG"
for fish_folder in ${FOLDERS_TO_LINK[@]}; do
  if [ -d "$FISH_HOME/$fish_folder" ]; then
    rm -r "$FISH_HOME/$fish_folder"
  else
    rm -f "$FISH_HOME/$fish_folder"
  fi
done

# add the symlinks for this project
for fish_folder in ${FOLDERS_TO_LINK[@]}; do
  ln -s ${BASE_DIR}/fish/${fish_folder} ~/.config/fish/${fish_folder}
done
