while true
do
cd McServer
screen -S Server
java -Xmx1024M -Xms1024M -jar server.jar nogui
done
