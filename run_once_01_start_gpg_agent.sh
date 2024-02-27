#!/bin/bash

. ~/.bashrc.d/ssh-auth-sock
systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket
