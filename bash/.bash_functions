#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Go

# wrapper for "go test"
# usage:
#   got TestMyFunc
#   got log
got() {
  local logfile=/tmp/gotest.log

  if [[ "$@" == "log" ]]; then
    vim $logfile
    return 0
  fi

  go test -v --run "$@" > $logfile
  grep "FAIL:\|PASS:" $logfile
  tail -n 1 $logfile
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# git
gbranch() {
  git branch 2> /dev/null | \
    sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | \
    tr -d '[:space:]'
}

gtag() {
    git push origin :"$1"
    git tag -d "$1"
    git tag "$1"
    git push origin "$1"
}

