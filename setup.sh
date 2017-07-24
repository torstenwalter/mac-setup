#!/usr/bin/env bash
brew doctor ||/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install bash-completion
brew install dnsmasq
brew install docker-completion
brew install docker-compose-completion
brew install graphviz
brew install xhyve
brew install docker-machine-driver-xhyve # used for minishift
ls -l /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve|grep "root  wheel" \
  ||sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
find /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve -perm +4000 \
  |grep docker-machine-driver-xhyve \
  ||sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
brew install git
brew cask install asciidocfx
brew cask install citrix-receiver
brew cask install docker
brew cask install evernote
brew cask install google-chrome
brew cask install intellij-idea
brew cask install istat-menus
brew cask install microsoft-office
brew cask install virtualbox

# needs virtualbox and xhyve
brew cask install minishift

grep /usr/local/etc/bash_completion ~/.bash_profile ||echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
