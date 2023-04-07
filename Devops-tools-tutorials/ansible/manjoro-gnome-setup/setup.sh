#!/bin/bash
## This script will automate the following processes.
# update packages,
# install ansible,
# create hosts inventory for playbook &
# will run the ansible-playbook.

# update package index
#sudo pacman -Syu

# install ansible
sudo pacman -S ansible --noconfirm

# check installation
ansible --version

# create the Ansible inventory directory
mkdir -p ~/ansible/inventory

# set environment variables from env_vars.yml
HOST_01_NAME=$(grep "host_01_name:" env_vars.yml | awk '{print $2}')

# add hosts to the Ansible inventory file
echo $HOST_01_NAME >> ~/ansible/inventory/hosts

# set environment variables from env_vars.yml
HOST_01=$(grep "host_01:" env_vars.yml | awk '{print $2, $3}')

# add hosts to the Ansible inventory file
echo $HOST_01 >> ~/ansible/inventory/hosts

# display the contents of the Ansible inventory file
cat ~/ansible/inventory/hosts

# set environment variables from env_vars.yml
PLAYBOOK_FILE=$(grep "playbook_file:" env_vars.yml | awk '{print $2}')

# run the Ansible playbook
#ansible-playbook $PLAYBOOK_FILE -i ~/ansible/inventory/hosts
