#!/bin/sh


# @todo set path
# @todo add Homebrew github API


# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Git
brew install git

brew update
brew doctor

# Tap useful Homebrew repos
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/php

# Install ZSH
brew install zsh

# Install Curl
brew install curl

# Temporarily alter PATH to use Homebrew's bin
export PATH="/usr/local/bin:$PATH"

# Add Zsh to the list of shells
sudo -A echo $(which zsh) >> /etc/shells

# Change shell to ZSH
chsh -s $(which zsh)


# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install Homebrew Cask
brew install caskroom/cask/brew-cask

# Install nodejs
brew install nodejs gcc46

# Install Xquartz
brew cask install xquartz

# Install iterm 2
brew cask install iterm2

# Install SourceTree
brew install sourcetree

# Install fontforge
brew install eot-utils fontforge --with-python 

# Set custom registry for NPM
npm set registry http://npm.lmyr-dev.com

# Install NPM packages
npm install -g gulp yo bower generator-lmi-drupal-gulp generator-mothership-child-theme typescript tsd@next

# Fetch rvm gpg key
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
 
# Install RVM with ruby
sudo -A curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install ruby 2.2.3
rvm install 2.2.3

# Use ruby 2.2.3
rvm use --default 2.2.3

# Install sass, scss_lint, bundler & fontcustom
gem install sass scss_lint bundler fontcustom

# Install php5.x, php7, xdebug, mariaDB
brew install php54 --with-fpm php54-xdebug
brew unlink php54

brew install php55 --with-fpm php55-xdebug
brew unlink php55

brew install php56 --with-fpm php56-xdebug
brew unlink php56

brew install php70 --with-fpm php70-xdebug

# @todo copy launchctl for php-fpm for each version

brew install mariadb 

# @todo switch php versions

# configure Xdebug
echo /dev/null > /usr/local/etc/php/5.6/conf.d/ext-xdebug.ini
cat xdebug/xdebug-5.4.ini > /usr/local/etc/php/5.4/conf.d/ext-xdebug.ini
cat xdebug/xdebug-5.5.ini > /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini
cat xdebug/xdebug-5.6.ini > /usr/local/etc/php/5.6/conf.d/ext-xdebug.ini

#@todo add xdebug-7.0.ini
cat xdebug/xdebug-7.0.ini > /usr/local/etc/php/7.0/conf.d/ext-xdebug.ini

sudo -A mkdir /var/log/xdebug/
sudo -A touch /var/log/xdebug/xdebug.log

sudo -A chmod -R a+rwx /var/log/xdebug

# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

export PATH=~/.composer/vendor/bin:$PATH

# Install drush
composer global require drush/drush:dev-master

# Install phpmd
composer global require phpmd/phpmd

# Install phpcs
composer global require squizlabs/php_codesniffer

# Install Drupal coder 
composer global require drupal/coder

# Symlink Drupal coding standards to use with phpcs 
ln -s ~/.composer/vendor/drupal/coder/coder_sniffer/Drupal ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/
## Don't forget to configure a Drupal scope in PHPStorm and set the Code Sniffer standard to Drupal

# Copy dotfiles folder to homeDir
cp -a .dotfiles ~/

# Copy .zshrc to homeDir
cp .zshrc ~/

# Remove existing .gitconfig
rm ~/.gitconfig
rm ~/.gitignore_global

# Copy .gitconfig & .gitignore_global to home dir
cp .gitconfig ~/
cp .gitignore_global ~/

# Link .gitconfig & .gitignore_global to dotfiles dir for versioning
ln -s ~/.gitconfig ~/dotfiles/
ln -s ~/.gitignore_global ~/dotfiles/


# Setup Mailcatcher with a rvm wrapper
rvm default@mailcatcher --create do gem install mailcatcher
rvm wrapper default@mailcatcher --no-prefix mailcatcher catchmail

# @todo parse plist file to change username, copy it, load it, change php.ini to use sendmail_path


# REACT NATIVE STUFF
sudo npm install -g react-native-cli

brew install watchman

brew install flow

# Install sequel-pro
brew cask install sequel-pro

