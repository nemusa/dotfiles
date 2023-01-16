# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias prune='git remote prune origin'
alias got='git' # Mein Gott, was ist das?!
alias gut='git'

# Other aliases
alias sl='ls' # Chill

# System tools
asuser() { sudo -u $1 /bin/bash; }

psgrep() { sleep 3; ps aux | grep -v grep | grep "$@" -i --color=auto; }

pskill() { sleep 4; psgrep $1 | awk '{ print $2 }' | xargs kill; }

whothe() { sleep 4; sudo lsof -i :$1;}

# Docker tools
docker-shell() { docker exec -i -t $1 /bin/bash; }

# Checksum checking
alias checkmd5='openssl md5'
alias checksha1='openssl sha1'
alias checksha256='openssl dgst -sha256'

# Set PATH, MANPATH, etc., for Homebrew.'
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set PATH for java
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11"

# # pyenv  and pyenv-virtualenv configuration
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="/usr/local/opt/openssl/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Projects setup
PROJECT_HOME=$HOME/Projects
mkdir -p $PROJECT_HOME
CURRENT=$(pwd)
if [ "$CURRENT" = "$HOME" ]; then
    cd $PROJECT_HOME
fi

# Docker setup
export DOCKER_BUILDKIT=1