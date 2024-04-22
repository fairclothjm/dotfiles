# execute .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -d $HOME/code/dotfiles/work ]; then
    . $HOME/code/dotfiles/work/work_profile
fi


ulimit -n 10240

export PATH="$HOME/bin:$PATH:$GOPATH/bin:/usr/local/go/bin"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env