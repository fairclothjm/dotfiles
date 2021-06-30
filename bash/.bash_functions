#!/usr/bin/env bash

# git
gbranch() {
    git branch 2> /dev/null | \
        sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | \
        tr -d '[:space:]'
};

gtag() {
    git push origin :"$1"
    git tag -d "$1"
    git tag "$1"
    git push origin "$1"
}

