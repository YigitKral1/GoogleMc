cd ~/McServer

while true
do
mem=$(grep MemTotal /proc/meminfo | sed -e 's/MemTotal:[ ]*//' | sed -e 's/ kB//') # some new stuff 
mem=$(($mem/1024/1024))
java -Xmx$memG -Xms$memG -jar server.jar nogui 
done
