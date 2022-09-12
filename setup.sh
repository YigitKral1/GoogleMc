#! /bin/bash

cd ~
mv setup.sh ~
sudo apt update -y && sudo apt upgrade -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install screen -y
sudo apt install nano -y
sudo apt install unzip -y
sudo apt install iputils-ping -y
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip
unzip ngrok-v3-stable-linux-amd64.zip
rm ngrok-v3-stable-linux-amd64.zip
clear
read -p "Enter Ngrok Authtoken: " ngrok
./ngrok config add-authtoken $ngrok
mkdir McServer
cd McServer
wget https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar
clear
echo "Do You Accept EULA?:"
echo
echo "1) Yes"
echo "2) No"
read -p "Answer: " eula
if [ $eula = "1" ]
then
wget https://raw.githubusercontent.com/YigitKral1/GoogleMc/main/eula.txt
else
cd ~
sudo rm McServer
rm ngrok
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
read -p "Enter Ngrok IP: " ip
while true
do
ping ip
done
