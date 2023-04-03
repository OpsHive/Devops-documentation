## **Installation of GitLab-ce**
***

You just need to replace values of env_vars.yml file with your desired values.
And by using following command, You've your private GitLab Instance READY!

```bash
sudo ./gitlab-flyme.sh
```

To restore backups first put their configuration in env_vars.yml file, then you have to run the following command,

```bash
sudo ./restore-backup.sh
```

To add backup configuration, first put their configuration in env_vars.yml file then run the following command,

```bash
sudo ./configure-backup.sh
```

And to completely uninstall GitLab including files, Run the following command,

```bash
sudo ./uninstall-gitlab-ce.sh
```

Command to check if your version is available or not,
```bash
"apt-cache madison gitlab-ee"
```
