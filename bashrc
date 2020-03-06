if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d /Users/jm/code/dotfiles/work ]; then
    . /Users/jm/code/dotfiles/work/work_aliases
    . /Users/jm/code/dotfiles/work/workrc
fi

# colors
# (
blck=$"\e[1;30m"
red=$"\e[1;31m"
grn=$"\e[0;32m"
yel=$"\e[1;33m"
blu=$"\e[1;34m"
mag=$"\e[1;35m"
cyn=$"\e[1;36m"
end=$"\e[0m"
dark_gray=$"\e[38;5;246m"
med_gray=$"\e[38;5;240m"
light_gray=$"\e[38;5;236m"
# )

# mac use grep colors
export GREP_OPTIONS='--color=always'
export GREP_COLOR='0;32'

# enable ls coloring
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
};

color() {
    echo -e "\\e[38;5;$1mhello color $1\e[0m"
}

if [[ -z "$VIMRUNTIME" ]]; then
    vim_shell=''
else
    vim_shell=' v'
fi

# bash
if [[ "$TERM" =~ 256color ]]; then
    PS1="\[${light_gray}\]\w\[${med_gray}\]\$(parse_git_branch)";
    #PS1+="\n";
    PS1+="\[${grn}\]${vim_shell}";
    PS1+="\[${dark_gray}\] $ \[${end}\]";
    PS1+="\[$(tput sgr0)\]";
    export PS1;
fi

# svn
export SVN_EDITOR=vim

# go
export GOPATH=$HOME/go


HISTFILESIZE=100000000


