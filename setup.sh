#!/usr/bin/env bash
brew doctor ||/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install coreutils
brew install dnsmasq
brew install docker-completion
brew install docker-compose-completion
brew install graphviz
brew install gpg
brew install maven
brew install ruby
brew install xhyve
brew install docker-machine-driver-xhyve # used for minishift
ls -l /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve|grep "root  wheel" \
  ||sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
find /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve -perm +4000 \
  |grep docker-machine-driver-xhyve \
  ||sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
brew install git
brew install wget
brew tap caskroom/drivers
brew cask install atom
brew cask install asciidocfx
brew cask install citrix-receiver
brew cask install divvy
brew cask install docker
brew cask install evernote
brew cask install google-chrome
brew cask install hipchat
brew cask install intellij-idea
brew cask install istat-menus
brew cask install iterm2
brew cask install java
brew cask install microsoft-office
brew cask install sonos
brew cask install synology-cloud-station-drive
brew cask install virtualbox

# needs virtualbox and xhyve
brew cask install minishift

brew install bash-completion
grep /usr/local/etc/bash_completion ~/.bash_profile ||echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile


brew tap torstenwalter/powerline-shell
brew install --HEAD powerline-shell
grep "powerline-shell.py" ~/.bash_profile \
  ||cat >> ~/.bash_profile << 'EOF'

    # powerline shell
    function _update_ps1() {
      PS1="$(/usr/local/opt/powerline-shell/powerline-shell.py --cwd-max-depth 4 $? 2> /dev/null)"
    }

    if [ "$TERM" != "linux" ]; then
      PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
EOF
brew tap caskroom/fonts
brew cask install font-anonymice-powerline
brew cask install font-consolas-for-powerline
brew cask install font-dejavu-sans-mono-for-powerline
brew cask install font-droid-sans-mono-for-powerline
brew cask install font-fira-mono-for-powerline
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-inconsolata-for-powerline
brew cask install font-inconsolata-g-for-powerline
brew cask install font-liberation-mono-for-powerline
brew cask install font-menlo-for-powerline
brew cask install font-meslo-for-powerline
brew cask install font-monofur-for-powerline
brew cask install font-roboto-mono-for-powerline
brew cask install font-source-code-pro-for-powerline
