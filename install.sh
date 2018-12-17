#!/bin/bash
xcode-select --install

# /usr/bin/ruby -e "$(curlma -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# pyenv install 2.7.15

CFLAGS="-I$(brew --prefix openssl)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.5.0
# PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.6.3

