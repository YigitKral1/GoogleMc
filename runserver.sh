while true
do
cd McServer
screen -S Ngrok
screen -X -S Ngrok ./ngrok tcp 25565
screen -S Server
screen -X -S Server java -Xmx1024M -Xms1024M -jar server.jar nogui
done
