# jenv manipulates the PATH and conflicts with RVM
#
# Τhis will run before rvm and we customly add jenv shims
# in the PATH in .zpath (after .zshrc)
#[[ -e /usr/local/bin/jenv ]] && eval "$(jenv init -)"
