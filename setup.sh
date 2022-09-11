#! /bin/bash

cd ~
mv setup.sh ~
sudo apt update -y && sudo apt upgrade -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install screen -y
sudo apt install nano -y
sudo apt install unzip -y
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip
unzip ngrok-v3-stable-linux-amd64.zip
rm ngrok-v3-stable-linux-amd64.zip
clear
read -p "Enter Ngrok Authtoken: " ngrok
./ngrok config add-authtoken $ngrok
mkdir McServer
cd McServer
clear
echo "OPTIONS"
echo "1) Paper"
echo "2) Bukkit"
echo "3) Spigot"
read -p "Server Type: " type
clear
echo 
read -p "Server Version: " version
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
echo "Do You Accept EULA?:"
echo "1) Yes"
echo "2) No"
read -p "Answer: " eula
if [ eula = "1" ]
then
wget https://raw.githubusercontent.com/YigitKral1/GoogleMc/main/eula.txt
else
cd ~
sudo rm McServer
rm ngrok
echo "Exiting..."
exit
fi
cd ~
wget https://raw.githubusercontent.com/YigitKral1/GoogleMc/main/runserver.sh
chmod +x *
clear
rm ~/setup.sh
screen -S server -d -m ./runserver.sh
screen -S ngrok -d -m ./ngrok tcp 25565
echo "Your server has been launched!"
echo "1) View IP Adress" 
echo "2) View Server Console"
read -p "Answer: " view
if [ view = "1" ]
then
echo "To Exit viewing, press CTRL+A and D"
sleep 5
screen -r ngrok
else
echo "To Exit viewing, press CTRL+A and D"
sleep 5
screen -r server
fi
