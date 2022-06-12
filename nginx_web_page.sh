#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx
cd /var/www/html
echo "<html><h1>This is WebServer 01</h1></html>" > index.html