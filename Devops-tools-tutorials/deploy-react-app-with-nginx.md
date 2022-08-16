# How to build & deploy React application with Nginx on Ubuntu 20.04

First of all, to build and deploy react app with nginx, we need to have some pre-requisites, running nginx server on our local machine that we did in the previous tutorial, and we also need a development environment running Node.js. Let's start by installing node.js on ubuntu 20.04

**STEP# 01:**
We're installing Node.js with Apt from the Default Repositories. First of all we'll go with:
```
sudo apt update
```
 
**STEP# 02:**
Now, we install Node.js by using command:
```
sudo apt install nodejs
```

**STEP# 03:**
Let's check that the installation was successful by querying node for its version number:
```
node -v
```

**STEP# 04:**
We’ll also want to install npm, the Node.js package manager. This will allow us to install modules and packages to use with Node.js. We can do this by installing the npm package with apt:
```
sudo apt install npm
```

**At this point, we've successfully installed Node.js and npm. Now, we'll move to the create a react project.**

**STEP# 05:**
We'll create a new application using **Create React App** in our local environment. In a terminal, run the command to build an application. In this tutorial, the project will be called **react-deploy**
```
npx create-react-app react-deploy
```

**OUTPUT:**
```
Output
Success! Created react-deploy at your_file_path/react-deploy
Inside that directory, you can run several commands:

  npm start
    Starts the development server.

  npm build
    Bundles the app into static files for production.

  npm test
    Starts the test runner.

  npm eject
    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

We suggest that you begin by typing:

  cd react-deploy
  npm start

Happy hacking!
```

**STEP# 06:**
By following the suggestion in the output, first move into the project folder:
```
cd react-deploy/
```

**STEP# 07:**
Now that we have a base project, run it locally to test how it will appear on the server. Run the project using the npm start script:
```
npm start
```

**Output**

```
Compiled successfully!

You can now view react-deploy in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://192.168.1.110:3000

Note that the development build is not optimized.
To create a production build, use npm build.
```

**STEP# 08:**
Open a browser and navigate to http://localhost:3000. You will be able to access the boilerplate React app.

**STEP# 09:**
Stop the project by CTRL+C  in a terminal.
Now, we need to create a production build. Run the following:
```
npm run build
```

**Output**
```
Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  41.21 KB  build/static/js/2.82f639e7.chunk.js
  1.4 KB    build/static/js/3.9fbaa076.chunk.js
  1.17 KB   build/static/js/runtime-main.1caef30b.js
  593 B     build/static/js/main.e8c17c7d.chunk.js
  546 B     build/static/css/main.ab7136cd.chunk.css

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json.

The build folder is ready to be deployed.
You may serve it with a static server:

  serve -s build

Find out more about deployment here:

  https://cra.link/deployment
  ```

**STEP# 10:**
Now, we'll determine Deployment File Location on our Ubuntu Server.
We'll look for our web server configuration in **/etc/nginx/sites-enabled**
Once we find the configuration file, display the output in our terminal with the following command:
```
cat /etc/nginx/sites-enabled/altaf.conf
```

**Output**
```
server {
       listen 80;
       listen [::]:80;

       server_name altaf.com www.altaf.com;

       root /var/www/altaf.website/;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}
```

**STEP# 11:**
At this point, your build files are ready to go. All you need to do is copy them to the server.  A quick way to do this is to use scp to copy your files to the correct location. 
The command format will be scp files_to_copy username@server_ip:path_on_server
```
scp -r ./build/* /var/www/altaf.website/index.html
```

**STEP# 12:**
When the command completes, we are finished. **Open a browser and navigate to our domain name. When we do**, we will find our React project.

Deploying React applications is a quick process when we use Create React App. We run the build command to create a directory of all the files we need for a deployment. After running the build, we copy the files to the correct location on the server, pushing our application live to the web.