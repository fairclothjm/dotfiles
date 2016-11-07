# colors
blck=$"\e[1;30m"
red=$"\e[1;31m"
grn=$"\e[0;32m"
yel=$"\e[1;33m"
blu=$"\e[1;34m"
mag=$"\e[1;35m"
cyn=$"\e[1;36m"
end=$"\e[0m"

# general CLI shortcuts
alias l="ls -lah"
alias please='sudo $(history -p !!)'
alias dirs="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# school
alias sch="cd programming/c++/scheck"
alias a3up="rsync -aruv -e ssh ~/Desktop/Assignment3 cosc185@program.cs.uh.edu:"
alias os="ssh program.cs.uh.edu -l cosc185"
alias rpg="java -jar /Users/fairclothjm/NetBeansProjects/GroupAssign2/dist/GroupAssign4.jar"
alias venkat="cd ~/programming/sw_design/dobson_faircloth/assign4/"

# pi


# mac
alias showallfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO"

# networking
alias lsnet="nmap -sn 192.168.1.0/24"

# git
alias glol="git log --graph --oneline --decorate"
alias gpom="git push origin master"
alias gs="git status"
alias gd="git diff"
alias rmds="find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch"
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
};

# bash
PS1="\[${grn}\]\W\$(parse_git_branch)";
# PS1+="\[${blu}\] @ \[${grn}\]\h";
PS1+="\n";
PS1+="\[${red}\] > \[${end}\]";
PS1+="\[$(tput sgr0)\]";
export PS1;


if [ -n "$COLORTERM" ];then
    alias ls="ls -F --color=auto"
    if [ -x "`which dircolors`" -a -r "$HOME/.dir_colors" ]; then
        eval `dircolors -b "$HOME/.dir_colors"`
    fi
else
    alias ls="ls -G"
fi

# editors
alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"

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

# svn
SVN_EDITOR=vim
export SVN_EDITOR

# python3
    # use Homebrew"s directories rather than ~/.pyenv
export PYENV_ROOT=/usr/local/var/pyenv
    # enable autocomplete and shims for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
