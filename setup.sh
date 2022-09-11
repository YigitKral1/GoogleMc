#! /bin/bash

mv setup.sh ~
sudo apt update -y && sudo apt upgrade -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install nano -y
mkdir McServer
cd McServer
clear
echo "Avaible Types:"
echo "1) Paper"
echo "2) Bukkit"
echo "3) Spigot"
read -p "Type: " type
clear
echo "Q: How to put your version?"
echo "A: Please put it like '1.19.2' etc."
read -p "Version: " version
if [ type = "1" ]
then
wget https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/141/downloads/paper-$version-141.jar
mv paper-$version-141.jar server.jar
elif [ type = "2" ]
then 
wget https://download.getbukkit.org/craftbukkit/craftbukkit-$version.jar
mv craftbukkit-$version.jar server.jar
else
wget https://download.getbukkit.org/spigot/spigot-$version.jar
mv spigot-$version.jar server.jar
fi
rm ~/setup.sh
