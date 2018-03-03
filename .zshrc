# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tasos/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
