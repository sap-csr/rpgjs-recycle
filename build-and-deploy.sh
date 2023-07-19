#!/bin/bash

echo "end-deploy begin"
sudo docker container stop rpgjs-recycle 
sudo docker container rm rpgjs-recycle 
echo "end-deploy done"

echo "build begin"
git pull origin main
sudo docker build -t rpg .
echo "build end"

echo "start-deploy begin"
sudo docker container run --name rpgjs-recycle -p 3000:3000 -d rpg 
echo "start-deploy done"
