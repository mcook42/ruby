#!/urs/bin/env bash

# install homebrew to make life easier (bonus: it's written in ruby)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install rbenv
brew install ruby-build

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /home/matt/.profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/matt/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install gcc

# https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
apt-get install autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

# START - only needed for VSCode
brew install watchman

watchman --version

bundle install
# to setup Sorbet for Ruby + VSCode
bundle exec tapicoa init

# END - only need for VSCode
