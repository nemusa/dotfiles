#!/bin/bash
## Copy configuration files
#rsync --exclude ".gitignore_global" --exclude ".gitconfig" --exclude ".git/" \
#      --exclude "install.sh" --exclude "README.md" --exclude "rabbitmqadmin" \
#      --exclude "dev" -av . ~

## Setup secret profile script
#touch $HOME/.profile_secret

# Shell setup
rsync -v .zshrc ~/.zshrc

# Git setup
rsync -v .gitignore_global ~/.gitignore

EMAIL=$(git config --global --get user.email)
rsync -v .gitconfig ~/.gitconfig

if [ -z "$EMAIL" ]; then
    printf "\nProvide email address for git:\n"
    read EMAIL
fi

printf "\nUsing address $EMAIL for git\n\n"
git config --global user.email "$EMAIL"

# Set up some directory shortcuts
#PROJECT_HOME=$HOME/Projects
#ln -sfv $HOME/.ssh/config $PROJECT_HOME/ssh_config
#ln -sfv $HOME/.ssh/known_hosts $PROJECT_HOME/known_hosts