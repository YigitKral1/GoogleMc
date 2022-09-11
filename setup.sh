#! /bin/bash

mv setup.sh ~
sudo apt update -y && sudo apt upgrade -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install nano -y
mkdir McServer
cd McServer
clear
echo "Select Your Server:"
echo "1) Paper"
echo "2) Bukkit"
echo "3) Spigot"
read -p "Answer: " type
clear
echo "Put In Your Version:"
read -p "Answer: " version
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
clear
echo "Do you accept eula?:"
echo "Y) Yes"
echo "N) No"
read -p "Answer: " eula
if [ eula = "y" ]
wget https://raw.githubusercontent.com/YigitKral1/GoogleMc/main/eula.txt
else
cd ~
rm McServer
fi
rm ~/setup.sh
