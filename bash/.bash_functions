#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Go

# wrapper for "go test"
# usage:
#   got TestMyFunc
#   got log
got() {
  local logfile=/tmp/gotest.log

  case "$1" in
    -h|h|--help|help)
      echo "usage: got [<command>] [<args>]"
      echo -e "\tgot TestMyFunc"
      echo -e "\tgot log"
      echo -e "\nA wrapper for \"go test\""
      return 0
      ;;
    -l|l|--log|log)
      vim $logfile
      return 0
      ;;
  esac

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

