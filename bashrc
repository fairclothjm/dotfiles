if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# colors
blck=$"\e[1;30m"
red=$"\e[1;31m"
grn=$"\e[0;32m"
yel=$"\e[1;33m"
blu=$"\e[1;34m"
mag=$"\e[1;35m"
cyn=$"\e[1;36m"
end=$"\e[0m"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
};

dark_gray=$"\e[38;5;246m"
med_gray=$"\e[38;5;240m"
light_gray=$"\e[38;5;236m"
color() {
    echo -e "\\e[38;5;$1mhello color $1\e[0m"
}

# bash
if [[ "$TERM" =~ 256color ]]; then
    PS1="\[${light_gray}\]\w\[${med_gray}\]\$(parse_git_branch)";
    #PS1+="\n";
    PS1+="\[${dark_gray}\] $ \[${end}\]";
    PS1+="\[$(tput sgr0)\]";
    export PS1;
fi

# svn
SVN_EDITOR=vim
export SVN_EDITOR

# python3
    # use Homebrew"s directories rather than ~/.pyenv
export PYENV_ROOT=/usr/local/var/pyenv
    # enable autocomplete and shims for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
