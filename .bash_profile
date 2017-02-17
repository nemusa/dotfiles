#!/bin/bash
# Additional applications path
PATH=/opt/puppetlabs/bin/:$PATH:/Applications/

# Projects setup
WORKON_HOME=$HOME/Virtualenvs
PROJECT_HOME=$HOME/Projects
mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

# Execute secret setup
source $HOME/.bash_profile_secret

source /usr/local/bin/virtualenvwrapper.sh

# Project directory shortcut
alias proj='cd $PROJECT_HOME'
proj

# SSH completion from ssh config and known hosts
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

# Py 01 utility scripts
export PY01_REPOS=$PROJECT_HOME
source $PY01_REPOS/not_a_secret/bashrc

# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias prune='git remote prune origin'
alias got='git' # Mein Gott, was ist das?!
alias gut='git'

# Enable git autocomplete
. $HOME/.git-completion.bash

# Other aliases
alias sl='ls' # Chill

# Python tools
alias delpyc='find . -name "*.pyc" -delete'

# System tools
asuser() { sudo -u $1 /bin/bash; }

psgrep() { sleep 3; ps aux | grep -v grep | grep "$@" -i --color=auto; }

pskill() { sleep 4; psgrep $1 | awk '{ print $2 }' | xargs kill; }

whothe() { sleep 4; sudo lsof -i :$1;}

# Docker tools
docker-shell() { docker exec -i -t $1 /bin/bash; }

