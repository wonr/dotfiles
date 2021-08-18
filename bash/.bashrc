#!/usr/bin/env bash

LANG="en_US.UTF-8"
LANGUAGE=en_US
#LC_COLLATE="en_US.UTF-8"
#LC_CTYPE="en_US.UTF-8"
#LC_MESSAGES="en_US.UTF-8"
#LC_MONETARY="en_US.UTF-8"
#LC_NUMERIC="en_US.UTF-8"
#LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# TERMINAL PROMPT
PS1="\w > "
export PS1;
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad # MacOS or BSD
# export LS_COLORS=	di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43 # Linux

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="$(brew --prefix)/bin:$PATH";
export BASH_SILENCE_DEPRECATION_WARNING=1; # Remove warning messages from zsh

# NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# COMMON DIRECTORIES
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias p="cd ~/proj"
alias home="cd ~"

# HELPFUL TERMINAL ALIASES
alias c="clear"
alias bashrc="vim ~/.bashrc && . ~/.bashrc"

# Original
alias ls='ls -FHG' # MacOS or BSD
# alias ls='ls -FH --color' # Linux
export EDITOR='vim'
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
