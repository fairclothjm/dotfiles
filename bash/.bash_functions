#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Go

# wrapper for "go test"
# usage:
#   got TestMyFunc
#   got log
#   got save
got() {
  local logfile=/tmp/gotest.log
  local filepath
  local tags

  case "$1" in
    h|help)
      echo "usage: got [<command>] [<args>]"
      echo -e "\tgot TestMyFunc"
      echo -e "\tgot ent TestMyFunc"
      echo -e "\tgot log"
      echo -e "\tgot save [FILENAME] - will be save to /tmp"
      echo -e "\tgot tail"
      echo -e "\tgot flaky TestMyFunc"
      echo -e "\nA wrapper for \"go test\""
      return 0
      ;;
    e|ent)
      shift
      tags="-tags enterprise"
      ;;
    f|flaky)
      shift
      for i in {1..10}; do got "$@" && got save "gotest-flaky-$i"; go clean -testcache; done
      return 0
      ;;
    l|log)
      vim $logfile
      return 0
      ;;
    s|save)
      if [[ -z "$2" ]]; then
        filename="gotest-$(date +"%m-%d-%Y-%H%M%S").log"
      else
        filename="$2.log"
      fi

      filepath="/tmp/$filename"
      cp "$logfile" "$filepath" && echo "got: saved log at $filepath"
      return 0
      ;;
    t|tail)
      tail -n 30 -F $logfile
      return 0
      ;;
  esac

  if [[ "$@" =~ "Test" ]]; then
    go test -parallel 8 $tags -v --run "$@" > $logfile
  else
    go test -parallel 8 $tags -v "$@" > $logfile
  fi

  # JM: why did I add this?
  # local code="$?"
  # [[ "$code" != 0 ]] && return "$code"

  echo "$(date)"
  grep -v "    --- PASS:" $logfile | grep "PASS:"
  GREP_COLOR='0;31' grep "FAIL:" $logfile
  GREP_COLOR='0;33' grep "SKIP:" $logfile
  tail -n 1 $logfile
}

# compile and execute dlv debugger
# usage: gotd TestFoo
gotd() {
  if [[ "$@" == "" ]]; then
      echo "usage: gotd [<args>]"
      echo -e "\tgotd TestMyFunc"
      return 0
  fi

  if [[ "$@" =~ "Test" ]]; then
    dlv test --headless --listen=:2345 -- -test.run "$@"
  else
    go test -c -o debug.test
    dlv exec debug.test
  fi
}

# get go coverage report in the browser
# usage : goc -run TestLogin_VMSSFlexOrchestrationMode
goc() {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# git

gbranch() {
  # use awk to trim leading and trailing whitespace
  # useful when in detached head state
  git branch 2> /dev/null | \
    sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | \
    awk '{$1=$1;print}'
}

gtag() {
    git push origin :"$1"
    git tag -d "$1"
    git tag "$1"
    git push origin "$1"
}

