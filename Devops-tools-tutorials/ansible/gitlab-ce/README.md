## **Installation of GitLab-ce**
***

HELLO! HELLO! HELLO! & WELCOME TO THE NEXT-LEVEL AUTOMATION HUB!!!

You don't need to worry about installing ansible.
You don't need to worry about creating inventory file.
You don't need to worry about playing ansible playbook.
You don't need to worry about finding your desired version.
You don't need to worry about setting your desired URL.
You don't need to worry about finding login credentials.

You just need to replace values of env_vars.yml file with your desired values.
And by using following miracle command, You've your private GitLab Instance READY!

```bash
sudo ./my-gitlab-ce.sh
```

To add backup configuration, you have to run the following command, (Optional)

```bash
sudo ansible-playbook -i ~/ansible/inventory/hosts ansible-playbook-gitlab-backups.yml
```

And to completely uninstall GitLab-ce including files, Run the following command.

```bash
sudo ./uninstall-gitlab-ce.sh
```
