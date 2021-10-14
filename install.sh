#!/bin/bash
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew tap fishtown-analytics/dbt
brew install dbt

brew install coreutils
brew install pyenv
brew install kubernetes-helm
brew install wget
brew install zlib bzip2

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include"


#CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix sqlite)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix zlib)/include" \
#LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix sqlite)/lib -L$(brew --prefix bzip2)/lib -L$(brew --prefix zlib)/lib" \
#pyenv install 3.6.13

LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" \
pyenv install --patch 3.6.5 < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib" \
pyenv install 3.9.1

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib" \
pyenv install 3.7.10

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include" \
LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib" \
pyenv install 3.8.10

pyenv global 3.6.5 3.7.10 3.8.10 3.9.1

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-251.0.0-darwin-x86_64.tar.gz
tar -xzf google-cloud-sdk-251.0.0-darwin-x86_64.tar.gz
rm -rf ~/google-cloud-sdk/
mv google-cloud-sdk/ ~/
export CLOUDSDK_PYTHON=$(which python)
bash ~/google-cloud-sdk/install.sh
bash ~/google-cloud-sdk/bin/gcloud init
~/google-cloud-sdk/bin/gcloud compute config-ssh --ssh-key-file ~/.ssh/id_rsa


git clone https://github.com/syndbg/goenv.git ~/.goenv

# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
