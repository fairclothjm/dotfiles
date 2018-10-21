# general CLI shortcuts
alias l="ls -lah"
alias please='sudo $(history -p !!)'

# pi
alias sshpi="ssh pi@10.0.0.131"

# mac
alias showallfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO"

# networking
alias lsnet="sudo nmap -sn 192.168.0.0/24"

# git
alias glol="git log --graph --oneline --decorate"
alias gpom="git push origin master"
alias gs="git status"
alias gd="git diff"
alias rmds="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch"

# vim
alias vi="/usr/local/bin/vim"

# c++
alias cppcompile="g++ -std=c++11 -stdlib=libc++"
alias vg="valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes"

# tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"

# VirtualBox
alias vblist="VBoxManage list runningvms"
alias ssherebus="ssh -p 3022 fairclothjm@127.0.0.1"
alias erebusdown="VBoxManage controlvm Erebus acpipowerbutton"
alias erebusup="VBoxManage startvm Erebus --type headless"
alias erebusoff="VBoxManage controlvm Erebus poweroff"

# Linux kernel development environment
alias sshnyx="ssh shok3001@10.0.0.9"
