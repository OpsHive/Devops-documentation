# How to Install NGINX on Ubuntu 20.04 and Host Website

**STEP# 01:**
First run the following command to retrieve information about new and updated packages before you proceed to install NGINX.
```
sudo apt-get update
```

**STEP# 02:**
Nginx is available in the Ubuntu package repository. So it's easy to install Nginx using the following command
```
sudo apt-get install nginx
```

**STEP# 03:**
To confirm the status of NGINX service, run the following command
```
sudo systemctl status nginx
```

The output of the command above confirms that NGINX is **active and running**. 

If you get a message indicating that NGINX is inactive, not started, or not running, then you can manually start the NGINX service by running the following command.
```
sudo systemctl start nginx
```

**STEP# 04:**
To check the nginx version, run:
```
sudo dpkg -l nginx
```
My version is shown as **1.18.0-0ubuntu1.3** at this time, and today is August 15, 2022.

**STEP# 05:**
After confirming that the NGINX service is **active and running**, you may now test the webserver by opening web browser and entering the IP address of your server on which NGINX is installed
or you can simply go to google.com and search:
```
localhost
```
You should see the default web page titled, "Welcome to nginx!"

**STEP# 06:**
To allow NGINX on port 80:
```
sudo ufw allow 'Nginx HTTP'
```

**STEP# 07:**
To allow NGINX on port 443:
```
sudo ufw allow 'Nginx HTTPS'
```
Until now we've intalled and run nginx that is hosting our default website. Now, in order to host multiple websites on the same server, we'll have to setup nginx server blocks seperately for each website.

# Setup NGINX Server Blocks(Virtual Hosts) to host another website

**STEP# 08:**
you would need to create a root folder under /var/www to store the contents for your additional website. For example, I am going to create a folder named altaf.website for my additional website.
```
sudo mkdir /var/www/altaf.website
```

**STEP# 09:**
Let's run the following command to create an index file for our additional website.
```
sudo nano /var/www/altaf.website/index.html
```

**STEP# 10:**
Next, we may copy and paste (using Ctrl+Shift+V) the following HTML code for testing purposes.
```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to altaf's website!</title>
<style>
body {
width: 35em;
margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif;
}
</style>
</head>
<body>
<h1>Welcome to altaf's website!</h1>
<p>If you see this page, the altaf's website is working!</p>
</body>
</html>
```
save the changes using **Ctrl+x** and then **y** and then press **enter**

**STEP# 11:**
The next step is to create a server block file to hold configuration details for the additional website. Run the following command.
```
sudo nano /etc/nginx/sites-available/altaf.conf
```

**STEP# 12:**
Paste the following sample virtual host configuration information using Ctrl+Shift+V
```
server {
       listen 80;
       listen [::]:80;

       server_name altaf.com www.altaf.com;

       root /var/www/altaf.website;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}
```
save the changes using **Ctrl+x** and then **y** and then press **enter**

**STEP# 13:**
To let NGINX know that the additional website is available, run the following command to create a symbolic link to the server block file
```
sudo ln -s /etc/nginx/sites-available/altaf.conf /etc/nginx/sites-enabled
```

**STEP# 14:**
Test your configuration using
```
sudo nginx -t
```
You should see a message indicating that everything is ok.

```
$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

**STEP# 15:**
to reload the configuration files
```
sudo service nginx reload
```

**STEP# 16:**
Open a web browser and enter your new website address. You should see the content of the index file created for your new website, rather than the default NGINX web page.

# Basic Commands to Control NGINX

The restart command will stop the service and then start it again.
```
sudo systemctl restart nginx
```

The reload command tells NGINX to reload its configuration files but without stopping the service.
```
sudo systemctl reload nginx
```

The stop command will stop the NGINX service.
```
sudo systemctl stop nginx
```

To enable the Nginx service to start up at boot, run
```
sudo systemctl enable nginx
```

# Basic NGINX Configuration & Log Files

/etc/nginx -- Contains all NGINX configuration files

/etc/nginx/sites-available -- Contains server block files which store configuration details for serving one or more websites

/etc/nginx/sites-enabled -- Contains configuration files for one or more enabled websites

/etc/nginx/nginx.conf -- Main configuration file which also reads configuration directives in other files

/var/log/nginx/access.log -- Default location for storing information about all visits to your website

/var/log/nginx/error.log -- Default location for storing NGINX errors

