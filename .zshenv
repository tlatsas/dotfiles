# Enable this for debugging
# set -x

# locale
export LANG=en_GB.UTF-8

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# node config variables
export NVM_DIR="$HOME/.nvm"

# misc
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# MySQL from homebrew
export MY_SQL=/usr/local/opt/mysql@5.7

# GO
export GOPATH=~/code/go
export GOROOT=/usr/local/opt/go/libexec

# python
export PYENV_ROOT="$HOME/.pyenv"
