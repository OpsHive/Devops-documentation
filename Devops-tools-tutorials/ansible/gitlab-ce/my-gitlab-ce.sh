#!/bin/bash
## This script will automate the following processes.
# update packages,
# install ansible,
# create hosts inventory for playbook &
# will run the ansible-playbook.

# update package index
apt update

# install software-properties-common
apt install -y software-properties-common

# add ansible PPA
apt-add-repository -y ppa:ansible/ansible

# update package index again
apt update

# install ansible
apt install -y ansible

# check installation
ansible --version

# create the Ansible inventory directory
mkdir -p ~/ansible/inventory

# set environment variables from env_vars.yml
HOST_01_NAME=$(grep "host_01_name:" env_vars.yml | awk '{print $2}')

# add hosts to the Ansible inventory file
echo $HOST_01_NAME >> ~/ansible/inventory/hosts

# set environment variables from env_vars.yml
HOST_01=$(grep "host_01:" env_vars.yml | awk '{print $2}')

# add hosts to the Ansible inventory file
echo $HOST_01 >> ~/ansible/inventory/hosts

# display the contents of the Ansible inventory file
cat ~/ansible/inventory/hosts

# set environment variables from env_vars.yml
PLAYBOOK_FILE=$(grep "playbook_file:" env_vars.yml | awk '{print $2}')

# run the Ansible playbook
ansible-playbook $PLAYBOOK_FILE -i ~/ansible/inventory/hosts
