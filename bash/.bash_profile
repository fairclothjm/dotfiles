# execute .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -d $HOME/code/dotfiles/work ]; then
    . $HOME/code/dotfiles/work/work_profile
fi


ulimit -n 10240

# oracle instant client
export DYLD_LIBRARY_PATH=/usr/local/lib

export PATH="$HOME/bin:$PATH:$GOPATH/bin:/usr/local/go/bin:$HOME/.local/bin"


eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
