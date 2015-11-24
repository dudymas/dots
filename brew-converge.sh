#!/bin/bash

which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
#brew tap dudymas/taps #this doesn't exist yet
brew install caskroom/cask/brew-cask htop mtr wget go gnupg watch jq wireshark tinc graphviz the_silver_searcher plantuml
brew cask install google-chrome vmware-appcatalyst licecap atom laullon-gitx iterm2 xscreensaver vlc skype slack hg vienna tuntap
