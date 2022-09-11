#! /bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install nano -y
mkdir McServer
cd McServer
read -p "Version: " versiyon
wget https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/141/downloads/paper-$versiyon-141.jar
