

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
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\w\$(parse_git_branch) $ "

# editors
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
