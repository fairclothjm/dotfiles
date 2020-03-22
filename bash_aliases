# general CLI shortcuts
alias l="ls -lah"
alias please='sudo $(history -p !!)'

# strip newline from pbcopy
alias copy="tr -d '\n' | pbcopy"

# ctags for js
alias jtags="ctags -R config src tests && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"

# mac
alias showallfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO"

# networking
alias lsnet="sudo nmap -sn 192.168.0.0/24"

# git
alias branchd="git branch | grep -v "master" | xargs git branch -D"
alias glol="git log --graph --oneline --decorate"
alias gpom="git push origin master"
alias gs="git status"
alias gd="git diff"
alias rmds="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch"

# editors
alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
alias vi="vim"

# c++
alias cppcompile="g++ -std=c++11 -stdlib=libc++"
alias vg="valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes"

# tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"

function cisserv() {
    ( cd ~/cis/CIS && source .venv/bin/activate && gunicorn --reload CIS.broker.broker.broker)
}

