# Additional applications path
PATH=/usr/local/opt/node@6/bin:/Applications:$HOME/google-cloud-sdk/bin:$HOME/bin:/usr/local/opt/gnu-getopt/bin:$PATH

# pyenv  and pyenv-virtualenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export GOENV_ROOT="$HOME/.goenv"
export PATH="/usr/local/opt/openssl/bin:$GOENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(goenv init -)"

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Projects setup
PROJECT_HOME=$HOME/Projects
mkdir -p $PROJECT_HOME

# Project directory shortcut
alias proj='cd $PROJECT_HOME'
proj

# Time in prompt
# export PS1='\D{%T} \h:\W \u\$ '

# Execute secret setup
source $HOME/.profile_secret


# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias prune='git remote prune origin'
alias got='git' # Mein Gott, was ist das?!
alias gut='git'
alias python3.6='python3'

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

make-list() { make -rpn | sed -n -e '/^$/ { n ; /^[^ ]*:/p ; }'; }

# Docker tools
docker-shell() { docker exec -i -t $1 /bin/bash; }


# Checksum checking
alias checkmd5='openssl md5'
alias checksha1='openssl sha1'
alias checksha256='openssl dgst -sha256'

export CLOUDSDK_PYTHON=$(which python)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Set up the env
export RABBITMQ_TEST_HOST='localhost'
export DB_TEST_HOST='localhost'
export REDIS_TEST_HOST='localhost'