#!/bin/bash
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install libffi \
  xz # installs lzma lib \
  pyenv \
  pyenv-virtualenv

brew install postgresql
brew install fzf
brew install openjdk@11
#brew tap fishtown-analytics/dbt
#brew install dbt
#
#brew install coreutils
#brew install kubernetes-helm
#brew install wget
#brew install zlib bzip2
brew install postgresql

sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
#
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#
eval "$(pyenv init -)"

export LDFLAGS="-L$(brew --prefix libffi)/lib -L$(brew --prefix xz)/lib"
export CFLAGS="-I$(brew --prefix libffi)/include -I$(brew --prefix xz)/include"

pyenv install 3.7.13
pyenv install 3.9.11
pyenv global 3.7.13 3.9.11

#WARNING: The Python ctypes extension was not compiled. Missing the libffi lib?
#WARNING: The Python lzma extension was not compiled. Missing the lzma lib?

#
curl -s "https://get.sdkman.io" | bash

## Show hidden files in finder
#defaults write com.apple.finder AppleShowAllFiles TRUE
#killall Finder
