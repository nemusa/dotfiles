#!/bin/bash
xcode-select --install

# /usr/bin/ruby -e "$(curlma -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew tap fishtown-analytics/dbt
brew install dbt

brew install coreutils
brew install pyenv
brew install kubernetes-helm
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

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.6.9

CFLAGS="-I$(brew --prefix openssl)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.0

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib" \
pyenv install 3.9.1


wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-251.0.0-darwin-x86_64.tar.gz
tar -xzf google-cloud-sdk-251.0.0-darwin-x86_64.tar.gz
rm -rf ~/google-cloud-sdk/
mv google-cloud-sdk/ ~/
export CLOUDSDK_PYTHON=$(which python)
bash ~/google-cloud-sdk/install.sh
bash ~/google-cloud-sdk/bin/gcloud init
~/google-cloud-sdk/bin/gcloud compute config-ssh --ssh-key-file ~/.ssh/id_rsa


git clone https://github.com/syndbg/goenv.git ~/.goenv
