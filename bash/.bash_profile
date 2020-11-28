# execute .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH:$GOPATH/bin:/usr/local/go/bin"
