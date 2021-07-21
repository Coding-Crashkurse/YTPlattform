# YTPlattform

## Prerequisites

* You need your own domain
* You need a remote server (if you don´t have one, get 100$ free via this link at digitalocean for your droplet)
* Root priviledges to run the bash script
* Your System should be Linux Ubuntu 20.04 machine

<br>

## How to setup the open source data science platform

<br>

1. Create a script.sh file with `touch script.sh`
2. Copy the code from the script.sh file into your script.sh file
3. run `bash script.sh` to setup everything.

The `script.sh` file will set up everything you need - clone the repository, install Docker, Docker-compose, SSL Certificates and more.
<br>

If everything worked and you did not get any errors (if you run into an error, check the prerequisites), `cd` into the `/home/datascience/` directory. Run `docker-compose up --build` to build all docker images and start the services.

<br>

If everything is up (Keycloak might take a while), go to https://yourdomain.com for shinyproxy or https://yourdomain.com/auth for the keycloak admin console.
