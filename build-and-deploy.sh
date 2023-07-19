#!/bin/bash

echo "build begin"
git pull origin main
#sudo docker image rm rpg
sudo docker image build -t rpg .
echo "build end"

echo ""

echo "end-deploy begin"
sudo docker container stop rpgjs-recycle 
sudo docker container rm rpgjs-recycle 
echo "end-deploy done"

echo ""

echo "start-deploy begin"
sudo systemctl stop nginx
sudo docker container run --name rpgjs-recycle -p 3000:3000 -d rpg
sudo systemctl start nginx
sudo systemctl restart nginx
echo "start-deploy done"
