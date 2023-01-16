#!/urs/bin/env bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
# https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
apt-get install autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

# install watchman to support Sorbet for Ruby. Use git repo to use the most stable version -- Ubuntu's version is insecure as of writing this script
# The installation directions provided by facebook for ubuntu did not work for my WSL2 installation, so I chose to use the build-from-source
# approach to avoid getting sidetracked while trying to learn Ruby
git clone https://github.com/facebook/watchman.git --depth 1 ~/repos/watchman
(
    cd ~/repos/watchman
    sudo apt-get install -y automake python2-dev
    ./autogen.sh
    ./configure --enable-lenient
    make
    sudo make install
)

watchman --version

bundle install
# to setup Sorbet for Ruby + VSCode
bundle exec tapicoa init
