
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
PLAYBOOK_FILE_3=$(grep "playbook_file_3:" env_vars.yml | awk '{print $2}')

# run the Ansible playbook
ansible-playbook $PLAYBOOK_FILE_3 -i ~/ansible/inventory/hosts
#sudo ansible-playbook -i ~/ansible/inventory/hosts ansible-playbook-gitlab-backups.yml