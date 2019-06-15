#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

EDITOR=xterm

## Stuff from 15 MAR 2017 file added 11 JUNE 2019

# Tab command completion for Bash
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# The fuck, a funny github script to auto correct commands
eval $(thefuck --alias)

# Powerline for bash
source ~/.bash-powerline.sh