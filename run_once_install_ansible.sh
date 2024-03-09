#!/bin/bash

sudo dnf install -y ansible
ansible-playbook ~/.config/install-packages.yml
echo "Ansible installation complete."

