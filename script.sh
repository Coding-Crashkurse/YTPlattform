#!/bin/bash

# Setup directory
rm -Rf /home/datascience
mkdir -p /home/datascience

git clone https://github.com/Data-Mastery/YTPlattform.git /home/datascience

apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

# Install Docker compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install nginx
apt install nginx -y

# Install snap
snap install core
snap refresh core


# Certbot
read -p "Please enter domain name (without wwww): " domain
read -p "Please enter your email: " email

install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
echo 2 | certbot certonly --nginx --agree-tos -d $domain -m $email

cp /etc/letsencrypt/live/${domain}/fullchain.pem /home/datascience/nginx/fullchain.pem
cp /etc/letsencrypt/live/${domain}/privkey.pem /home/datascience/nginx/privkey.pem

# Certs in .pfx wandeln für keystore.
openssl pkcs12 -inkey /home/datascience/nginx/privkey.pem -in /home/datascience/nginx/fullchain.pem -export -passout pass:"changeit" -out /home/datascience/shinyproxy/certificate.pfx

# nginx stoppen damit ports nicht belegt sind
systemctl stop nginx

# Kill apache or nginx which might block port 80
lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill

#Download shinyproxy
wget https://nexus.openanalytics.eu/repository/snapshots/eu/openanalytics/shinyproxy/2.5.1-SNAPSHOT/shinyproxy-2.5.1-20210521.074523-12.jar -O /home/datascience/shinyproxy/shinyproxy.jar
