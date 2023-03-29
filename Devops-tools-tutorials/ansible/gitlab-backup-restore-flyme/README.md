## **Installation of GitLab-ce**
***

You just need to replace values of env_vars.yml file with your desired values.
And by using following command, You've your private GitLab Instance READY!

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
