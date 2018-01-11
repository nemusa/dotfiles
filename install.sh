#!/bin/bash
sudo easy_install pip
sudo pip install virtualenv

xcode-select --install

git clone https://github.com/pyenv/pyenv.git
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

CFLAGS="-I$(brew --prefix openssl)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.5.0
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.6.3

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"