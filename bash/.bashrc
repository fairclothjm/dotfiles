if [ -d /Users/$USER/code/dotfiles/bash ]; then
    . ~/.bash_aliases
    . ~/.bash_functions
    . ~/.vaultrc
fi

if [ -d /Users/$USER/code/dotfiles/work ]; then
    . /Users/$USER/code/dotfiles/work/work_aliases
    . /Users/$USER/code/dotfiles/work/workrc
fi

if [ "$(uname)" == "Darwin" ]; then
    # https://news.ycombinator.com/item?id=21317623&p=2
    if [ "$BASH_SILENCE_DEPRECATION_WARNING" != 1 ]; then
        export BASH_SILENCE_DEPRECATION_WARNING=1
    fi
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
dark_gray=$"\e[38;5;246m"
med_gray=$"\e[38;5;240m"
light_gray=$"\e[38;5;236m"

# mac use grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

# enable ls coloring
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad


if [[ -z "$VIMRUNTIME" ]]; then
    vim_shell=''
else
    vim_shell=' v'
fi

# bash
if [[ "$TERM" =~ 256color ]]; then
    PS1="\[${light_gray}\]\w \[${med_gray}\]\$(gbranch)";
    PS1+="\[${grn}\]${vim_shell}";
    PS1+="\[${dark_gray}\] $ \[${end}\]";
    PS1+="\[$(tput sgr0)\]";
    export PS1;
fi

export EDITOR=vim

# go
export GOPATH=$HOME/go


# history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTSIZE=2000000
export HISTFILESIZE=30000000

