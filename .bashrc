#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PATH=$PATH:~/.gem/ruby/2.0.0/bin
export EDITOR=vim
PS1='\[\e[0;33m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[0;33m\]\$\[\e[m\] '
