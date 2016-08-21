#!/bin/bash
# Project setup

WORKON_HOME=$HOME/Virtualenvs
PROJECT_HOME=$HOME/Projects
mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

source /usr/local/bin/virtualenvwrapper.sh

cd $PROJECT_HOME

# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias got='git'

# Python tools
alias delpyc='find . -name "*.pyc" -delete'

# System tools
psgrep() {
    ps axuf | grep -v grep | grep "$@" -i --color=auto;
}
