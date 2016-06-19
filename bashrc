# colors
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# general CLI shortcuts
alias l='ls -lah'

# school
alias sch='cd programming/c++/scheck'
alias a3up='rsync -aruv -e ssh ~/Desktop/Assignment3 cosc185@program.cs.uh.edu:'
alias os='ssh program.cs.uh.edu -l cosc185'

# mac
alias showallfiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO'

# networking
alias lsnet='nmap -sn 192.168.1.0/24'

# git
alias gpom='git push origin master'
alias gs='git status'
alias gd='git diff'
alias rmds='find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch'
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="${grn}\w\$(parse_git_branch)\[\n\] ${red} > ${end}"

# editors
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# tmux
alias tmn='tmux new -s'
alias tma='tmux a -t'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'

