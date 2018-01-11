#!/bin/bash
rsync --exclude ".gitignore_global" --exclude ".gitconfig" --exclude ".git/" --exclude "install.sh" --exclude "README.md" -av . ~

# Setup secret profile script
touch $HOME/.bash_profile_secret

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
PROJECT_HOME=$HOME/Projects
ln -sfv $HOME/.ssh/config $PROJECT_HOME/ssh_config
ln -sfv $HOME/.ssh/known_hosts $PROJECT_HOME/known_hosts

# iCloud folder for shared files
mkdir -p $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/shared_projects
ln -sfv $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/shared_projects $PROJECT_HOME/

# Sublime Text setup
rsync -v Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
