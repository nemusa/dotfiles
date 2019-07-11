#!/bin/bash
# Additional applications path
PATH=/usr/local/opt/node@6/bin:$PATH:/Applications:$HOME/google-cloud-sdk/bin:$HOME/bin

# pyenv  and pyenv-virtualenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/usr/local/opt/openssl/bin:$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Projects setup
PROJECT_HOME=$HOME/Projects
mkdir -p $PROJECT_HOME

# Project directory shortcut
alias proj='cd $PROJECT_HOME'
proj

# Time in prompt
export PS1='\D{%T} \h:\W \u\$ '

# Execute secret setup
source $HOME/.bash_profile_secret

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

# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias prune='git remote prune origin'
alias got='git' # Mein Gott, was ist das?!
alias gut='git'

# Enable git and rabbitmq autocomplete
. $HOME/.git-completion.bash
. $HOME/.rabbitmq-completion.bash
. $HOME/.kubectl-completion.bash

# Other aliases
alias sl='ls' # Chill

# Python tools
alias delpyc='find . -name "*.pyc" -delete'

# System tools
asuser() { sudo -u $1 /bin/bash; }

psgrep() { sleep 3; ps aux | grep -v grep | grep "$@" -i --color=auto; }

pskill() { sleep 4; psgrep $1 | awk '{ print $2 }' | xargs kill; }

whothe() { sleep 4; sudo lsof -i :$1;}

awslogin() { aws sts get-session-token --serial-number "$MFA_SERIAL" --token-code $1; }

# Docker tools
docker-shell() { docker exec -i -t $1 /bin/bash; }

# Machine Learning
alias octave="/usr/local/octave/3.8.0/bin/octave-3.8.0;"

# Checksum checking
alias checkmd5='openssl md5'
alias checksha1='openssl sha1'
alias checksha256='openssl dgst -sha256'

export CLOUDSDK_PYTHON=$(which python)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# The next line enables shell command completion for helm.
if [ -f '/usr/local/etc/bash_completion.d/helm' ]; then . '/usr/local/etc/bash_completion.d/helm'; fi

# Set up the env
export RABBITMQ_TEST_HOST='localhost:5672'
export DB_TEST_HOST='localhost'
export REDIS_TEST_HOST='localhost'