#!/bin/sh

# Kill agent if it's already running
killall gpg-agent

# Ensure gpg-agent handles ssh authentication
unset SSH_AUTH_SOCK
eval $(gpg-agent --daemon --enable-ssh-support)

# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
