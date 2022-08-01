#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

pfetch 
scripts=/home/daz/bashScripts
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
source ${scripts}/aliases.sh

