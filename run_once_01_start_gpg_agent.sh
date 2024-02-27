#!/bin/bash

systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket
. ~/.bashrc.d/ssh-auth-sock
