# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


pfetch 
scripts=/home/daz/bashScripts
alias ls='ls --color=auto'
source ${scripts}/aliases.sh

eval "$(starship init zsh)"
