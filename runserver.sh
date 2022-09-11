screen -S Ngrok
screen -X -S Ngrok ~/./ngrok tcp 25565
screen -S Server
screen -X -S while true do cd minecraft && Server java -Xmx1024M -Xms1024M -jar server.jar nogui done
