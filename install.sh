#!/bin/bash

git pull
rsync --exclude ".gitignore_global" --exclude ".git/" --exclude "install.sh" --exclude "README.md" -av . ~

# Git setup
rsync -v .gitignore_global ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Set up some directory shortcuts
PROJECT_HOME=$HOME/Projects
ln -sfv $HOME/.ssh/config $PROJECT_HOME/ssh_config
ln -sfv $HOME/.ssh/known_hosts $PROJECT_HOME/known_hosts

# Sublime Text setup
rsync -v Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
