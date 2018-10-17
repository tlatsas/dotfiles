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

source ~/.alias

__rvm_ps1() {
    if [[ `rvm current` != "system" ]]; then
        echo "[ $(rvm-prompt) ]"
    else
        echo ''
    fi
}

# set prompt function
_set_prompt() {
    autoload -U zsh/terminfo
    autoload -U colors && colors

    # make some aliases for the colours: (coud use normal escap.seq's too)
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$fg[${(L)color}]%}'
        eval PR_${color}_B='%{$fg_bold[${(L)color}]%}'
    done
    PR_RST="%{$terminfo[sgr0]%}"

    # git prompt
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    setopt PROMPT_SUBST
    p_git='$(__git_ps1 "( %s )" )'
    local p_rvm='$(__rvm_ps1)'

    PS1=" $PR_WHITE¦ $PR_CYAN_B%~$PR_RST $PR_MAGENTA$p_git$PR_RST $PR_YELLOW$p_rvm$PR_RST"

    # ugly indentation for multi-line prompts!
    if [[ $UID -eq 0 ]]; then
       PS1="$PR_RED_B%n$PR_RST$PS1
$PR_RED>$PR_RED_B>$PR_RST "
    else
       PS1="$PR_GREEN_B%n$PR_RST$PS1
$PR_GREEN>$PR_GREEN_B>$PR_RST "
    fi
}
_set_prompt

#Make sure zsh-git-prompt is loaded from your .zshrc:
#source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

source ~/.zpath
source ~/.zfunc
