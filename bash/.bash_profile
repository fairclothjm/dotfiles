# execute .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

ulimit -n 10240

export PATH="$HOME/bin:$PATH:$GOPATH/bin:/usr/local/go/bin"
