#!/usr/bin/env bash

# git
parse_git_branch() {
    git branch 2> /dev/null | \
        sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
};

gtag() {
    git push origin :"$1"
    git tag -d "$1"
    git tag "$1"
    git push origin "$1"
}

# vault
vkill() {
    ps aux | \
        grep "vault server" | \
        grep -v grep | \
        awk '{print $2}' | \
        xargs kill
}

