#!/bin/bash

sudo dnf install -y ansible
ansible-playbook ~/.config/install-packages.yml --ask-become-pass
echo "Ansible installation complete."

