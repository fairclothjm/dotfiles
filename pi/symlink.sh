#!/usr/bin/env bash

#
#; script to symlink config files
#; run this from the pi dir
#

if [[ -z $TERM ]]; then
    $TERM="xterm"
fi

# do not symlink these
readonly -a skip=(`basename "$0"` "README.md")

readonly dir_path="/home/pi/code/dotfiles"
readonly pi_path="${dir_path}/pi"
readonly git_path="${dir_path}/git"

# fancy color for errors
readonly txtred="$(tput -T $TERM setaf 1)"
readonly txtreset="$(tput -T $TERM sgr0)"

check_code() {
    local code=$1
    local file=$2

    if [[ "$code" -ne 0 ]]; then
        echo "${txtred}[error]${txtreset} could not symlink $file"
    else
        echo "created symlink to $file"
    fi
}


for file in `ls ${pi_path}`; do
    if [[ ! " ${skip[@]} " =~ " ${file} " ]]; then
        ln -sf $pi_path/$file ~/.$file
        check_code $? $file
    fi
done


echo "setting up git configs"
for file in `ls ${git_path}`; do
    ln -sf $git_path/$file ~/.$file
    check_code $? $file
done

ls -lah --color=always ~
