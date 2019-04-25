#!/bin/bash
# Copy configuration files
rsync --exclude ".gitignore_global" --exclude ".gitconfig" --exclude ".git/" \
      --exclude "install.sh" --exclude "README.md" --exclude "rabbitmqadmin" \
      --exclude "dev" -av . ~

# Setup secret profile script
touch $HOME/.bash_profile_secret

# Git setup
rsync -v .gitignore_global ~/.gitignore

# Rabbitmq admin setup
rsync -v rabbitmqadmin /usr/local/bin/rabbitmqadmin

EMAIL=$(git config --global --get user.email)
rsync -v .gitconfig ~/.gitconfig

if [ -z "$EMAIL" ]; then
    printf "\nProvide email address for git:\n"
    read EMAIL
fi

printf "\nUsing address $EMAIL for git\n\n"
git config --global user.email "$EMAIL"

# Set up some directory shortcuts
PROJECT_HOME=$HOME/Projects
ln -sfv $HOME/.ssh/config $PROJECT_HOME/ssh_config
ln -sfv $HOME/.ssh/known_hosts $PROJECT_HOME/known_hosts

# Sublime Text setup
rsync -v Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
