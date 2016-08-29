#!/bin/bash
# Project setup

WORKON_HOME=$HOME/Virtualenvs
PROJECT_HOME=$HOME/Projects
mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

# Execute secret setup
source $HOME/.bash_profile_secret

source /usr/local/bin/virtualenvwrapper.sh

cd $PROJECT_HOME

# Py 01 utility scripts
export PY01_REPOS=$PROJECT_HOME
source $PY01_REPOS/not_a_secret/bashrc

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

