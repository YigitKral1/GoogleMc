cd ~/McServer

while true
do
mem=$(grep MemTotal /proc/meminfo | sed -e 's/MemTotal:[ ]*//' | sed -e 's/ kB//')

mem=$(($mem/1024/1024))

java -Xmx${mem}G -Xms${mem}G -jar server.jar nogui
done
