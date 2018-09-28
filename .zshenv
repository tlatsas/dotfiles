# Enable this for debugging
# set -x

# locale configuration
export LANG=en_US.utf8
export LC_ALL=C

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# node config variables
export N_PREFIX=${HOME}/.n
export NPM_PACKAGES=${HOME}/.npm-packages

# misc
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
