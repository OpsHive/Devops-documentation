# Deploying Nginx image with Docker

We'll create a Docker Container for Nginx. The official Nginx image is available on Dockerhub, so we don’t have to worry about building our own image for Nginx. 

**STEP# 01:**

We can simply pull the image by using:

```
docker pull nginx
```

The command installs all the necessary components for us. Besides, the image also comes with **preset configurations** for running the server.

**STEP# 02:**

To find/search or verify our docker image:

```
sudo docker images
```

Now, to run a docker and to deploy image in a continer, we need to have three main files.
1. Docker file(Dockerfile),
2. Configuration file(default.conf) and 
3. an index file(index.html)

**STEP# 03:**

Now, we'll make a seperate directory for these three files.

```
sudo mkdir nginx-in-docker
```

**STEP# 04:**

Now, we'll enter in the directory by using:

```
cd nginx-in-docker/
```

Now, we'll create all the three files by following the steps and by using the commands below:

**STEP# 05:**

```
touch Dockerfile
```

**STEP# 06:**

```
touch default.conf
```

**STEP# 07:**

```
touch index.html
```

Now, we'll edit all the three files using nano and put the contents in it.

**STEP# 08:**

First we'll edit Docker file by using:

```
nano Dockerfile
```

And we'll paste the following script in it, by using Ctrl+Shift+V to paste the following script:

```
FROM ubuntu
RUN apt update && apt install -y nginx
COPY default.conf /nginx/sites-available/default.conf
RUN rm -f /etc/nginx/sites-enabled/default
COPY default.conf /etc/nginx/sites-enabled/ 
RUN rm -f /var/www/html/index.html
COPY index.html /var/www/html
EXPOSE 80
RUN service nginx restart
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
```

**STEP# 09:**

Now, we'll edit congiguration file by using:

```
nano default.conf
```

and we'll paste the following configuration in it, by using Ctrl+Shift+V:

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    root /var/www/html;
    index index.html index.html;

    server_name _;
    location / {
        try_files $uri $uri/ =404;
    }
}
```

**STEP# 10:**

Now, we'll edit the index file by using:

```
nano index.html
```

and we'll paste the following configuration in it, by using Ctrl+Shift+V:

```
<!DOCTYPE html>
<html>
<head>
<title>Nginx in Docker</title>
</head>
<body>

<h1>This is nginx server running in a docker container</h1>
<p>Docker container can run nginx server inside it.</p>

</body>
</html>
```

Now, as we've ready dockerfile, its configuation file and index.html file. In the very next step, we've to build an image and run a continer using that image. 

**STEP# 11:**

We assume image name as "nginx-docker", to build an image, we use:

```
docker build . -t <nginx-docker>
```

**STEP# 12:**

Now, we'll assign port 8080 to the docker and run the container by using:

```
docker run -d -p 8080:80 <nginx-docker>
```

**STEP# 13:**

Now, we'll open the browser and navigate to port 8080 by simply searching localhost:8080. When we do, we will find our Nginx server index file.