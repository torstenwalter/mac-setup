#!/usr/bin/env bash
which brew ||/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

echo "create links for docker-machine-driver-xhyve"
ls -l /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve|grep "root[ ]*wheel" \
  ||sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
find /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve -perm +4000 \
  |grep docker-machine-driver-xhyve \
  ||sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# configure bash_completion
grep /usr/local/etc/bash_completion ~/.bash_profile ||echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile

# configure powerline-shell
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
