curl -LO https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_x64_linux_hotspot_16.0.1_9.tar.gz
tar xzf OpenJDK16U-jre_x64_linux_hotspot_16.0.1_9.tar.gz
export PATH=$PWD/jdk-16.0.1+9-jre/bin:$PATH
#java -version

rm /home/gitpod/.ngrok2/ngrok.yml ngrok-stable-linux-amd64.zip ngrok eula.txt
pkill -9 ngrok
curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1vfuf0ovWDUgXGDYH2u4b9jKuT8_3cswXrtzbt3hfhAiMtATd
./ngrok tcp 25565 --log=stdout > ngrok.log &
sleep 1
grep -o -P '(?<=localhost:25565 url=tcp://).*' ngrok.log > ngrokID
echo "your minecraft ip is [[$(cat ngrokID)]] (wait a bit) "

for i in {1..5}
do
   echo "your minecraft ip is [[$(cat ngrokID)]] (wait a bit) MEMORISE IT COPY THAT LOL "
   sleep 2
   echo "server ip: $(cat ngrokID)" > YOUR___SERVER_IP$i
done

curl -L -o meincraft.jar "https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/123/downloads/paper-1.17.1-123.jar"
echo "eula=true" > eula.txt
java -Xms2G -Xmx2G -jar meincraft.jar --nogui