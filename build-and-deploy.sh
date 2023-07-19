#!/bin/bash

echo "build begin"
git pull origin main
sudo docker build -t rpg .
echo "build end"

echo ""

echo "end-deploy begin"
sudo systemctl stop nginx
sudo docker container stop rpgjs-recycle 
sudo docker container rm rpgjs-recycle 
sudo systemctl start nginx
echo "end-deploy done"

echo ""

echo "start-deploy begin"
sudo docker container run --name rpgjs-recycle -p 3000:3000 -d rpg:latest
echo "start-deploy done"
