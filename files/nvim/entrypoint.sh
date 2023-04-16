#!/bin/bash

# Check if the source folder is empty.
if [ -z "$(ls -A ~/.config/nvim)" ]; then
  # If it is empty, copy the destination folder to the source folder.
  cp --recursive --no-clobber ~/.config/nvim.bk/* ~/.config/nvim
  echo "Folder copied successfully."
else
  # If it is not empty, do nothing.
  echo "Source folder is not empty. No action taken."
fi

# Execute Neovim.
nvim
