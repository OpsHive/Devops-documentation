sudo gitlab-ctl stop
sudo gitlab-ctl remove-accounts
sudo gitlab-ctl uninstall
sudo aptitude purge gitlab-ce
sudo dpkg -P --force-all gitlab-ce
sudo dpkg -P gitlab-ce
sudo gitlab-ctl cleanse
sudo apt-get purge gitlab-ce
sudo rm -rf /opt/gitlab/sv
sudo rm -rf /opt/gitlab/embedded/cookbooks
sudo rm -rf /root/gitlab-cleanse*
sudo rm -rf /opt/gitlab*
sudo rm -rf /var/opt/gitlab*
sudo rm -rf /etc/gitlab*
sudo rm -rf /var/log/gitlab*
sudo rm -rf /var/opt/gitlab  
sudo rm -rf /etc/apt/sources.list.d/runner_gitlab-runner.list*
sudo rm -rf /etc/apt/sources.list.d/gitlab_gitlab-ee.list*
sudo rm -rf /etc/apt/sources.list.d/gitlab_gitlab-ce.list*
sudo apt update && sudo apt upgrade -y