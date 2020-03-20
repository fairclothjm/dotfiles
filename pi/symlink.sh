#!/usr/bin/env bash

for file in `ls $(pwd)`; do
    if [[ "$file" == `basename "$0"` ]]; then
        continue
    fi
    echo "Creating symlink to $file"
    ln -sf $(pwd)/$file ~/.$file
done
