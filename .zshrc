# Git aliases
alias st='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias br='git branch'
alias prune='git remote prune origin'
alias got='git' # Mein Gott, was ist das?!
alias gut='git'

# Other aliases
alias sl='ls' # Chill

# Interactive profiles
alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'

function aws_persist() {
  rm -f ~/.aws/credentials
  cat <<EOF >> ~/.aws/credentials
[default]
aws_access_key_id=$(echo "$AWS_ACCESS_KEY_ID")
aws_secret_access_key=$(echo "$AWS_SECRET_ACCESS_KEY")
aws_session_token=$(echo "$AWS_SESSION_TOKEN")
EOF
}

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

# Set PATH for apps
export PATH="$HOME/Applications:$PATH"

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
source $HOME/.environment


# Docker setup
export DOCKER_BUILDKIT=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhartleb/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhartleb/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhartleb/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhartleb/Applications/google-cloud-sdk/completion.zsh.inc'; fi