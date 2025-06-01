#! /usr/bin/bash

set -e

sudo apt update -y
sudo apt install nginx curl git -y

sudo systemctl start nginx
sudo systemctl enable nginx

git clone https://github.com/anki2000/full-stack-todo-list-app.git

cd full-stack-todo-list-app/frontend/

sed -i "s/BACKEND_LB_DNS_VALUE/${BACKEND_LB_DNS}/g" ./config.js

cp -r ./* /var/www/html/
