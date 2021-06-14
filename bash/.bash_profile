# execute .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH="$HOME/bin:$PATH:$GOPATH/bin:/usr/local/go/bin"
