#!/bin/bash

if
  [[ "${USER:-}" == "root" ]]
then
  echo "This script works only with normal user, it wont work with root, please log in as normal user and try again." >&2
  exit 1
fi

set -e
echo "Installs curl"
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

echo "Installs terminator"
sudo apt-get install terminator

echo "Installs vim"
sudo apt-get install vim
git clone https://github.com/rogeriobispo/my_vim_files.git ~/.vim
cd ~/.vim
make
echo "source ~/.vim/vimrc" > ~/.vimrc
sudo apt-get install silversearcher-ag
cd -

echo "installs docker"
curl -fsSL get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo usermod -aG docker $USER
docker --version

echo "Installs docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Updates packages. Asks for your password."
sudo apt-get update -y

echo "Installs packages. Give your password when asked."
sudo apt-get --ignore-missing install build-essential git-core curl openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev python-software-properties libffi-dev libgdm-dev libncurses5-dev automake autoconf libtool bison postgresql postgresql-contrib libpq-dev pgadmin3 libc6-dev nodejs -y

echo "Installs ImageMagick for image processing"
sudo apt-get install imagemagick --fix-missing -y

echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
# Retrieve the GPG key.
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Installs Ruby"
rvm install 2.4.1
rvm use 2.4.1 --default

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem install rails

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"


echo -n "Should be sqlite 3.8.1 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.26.11 or higher:         "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-11
echo -n "Should be ruby 2.4.1:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 4.2.1 or higher:         "
rails -v
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions
don't match or errors are shown, something went wrong with the automated process
and we will help you do the installation the manual way at the event.

Congrats!

Make sure that all works well by running the application generator command:
    $ rails new railsgirls

If you encounter the message:
    The program 'rails' is currently not installed.

It is just a hiccup with the shell, solutions:
    $ source ~/.rvm/scripts/rvm
    Allow login shell, example http://rvm.io/integration/gnome-terminal/"


echo "Installs homyzsh"
sudo apt-get update
sudo apt-get install git-core zsh
sudo cp $(which zsh) /etc/shells
sudo usermod -s $(which zsh) $USER
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
cp .zshrc ~
shutdown -r 0
