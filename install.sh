#!/bin/bash
sudo easy_install pip
sudo pip install virtualenv

xcode-select --install

git clone https://github.com/pyenv/pyenv.git
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.5.0

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
