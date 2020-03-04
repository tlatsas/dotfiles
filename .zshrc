[[ $- != *i* ]] && return

set -o noclobber
bindkey -e

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt nomatch

unsetopt autocd beep

# remove percent sign for same-line outputs
unsetopt PROMPT_SP

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

bindkey '\e[1~' beginning-of-line
bindkey '\e[2~' overwrite-mode
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '\e[5~' up-line-or-history
bindkey '\e[6~' down-line-or-history
bindkey '^?' backward-delete-char
bindkey '\e[D' backward-char
bindkey '\e[C' forward-char

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

ZSH=~/ohmyzsh
source ${ZSH}/lib/prompt_info_functions.zsh
source ${ZSH}/lib/spectrum.zsh
source ${ZSH}/lib/theme-and-appearance.zsh
source ${ZSH}/lib/spectrum.zsh
source ${ZSH}/lib/git.zsh
source ${ZSH}/plugins/git/git.plugin.zsh

# theme, aka zsh prompt
source ~/zsh-themes/avit-custom.zsh-theme

source ~/.zpath
source ~/.zfunc
source ~/.alias
