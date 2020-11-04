#!/bin/bash

#build docker file host and firewall
cd Host/
./setup_host.sh
cd ..
cd Firewall 
./setup_firewall.sh 
cd ..
cd Web_server
./setup_webserver.sh
cd ..

############# NETWORK CONFIGURATION #############

#EXTERNAL HOST
docker network create -d bridge --subnet=200.1.1.0/24 external_net
docker run --privileged --network=external_net --ip 200.1.1.5 -t -d --name=External_User host_ubuntu bash

#INTERNAL_WEBSERVER
docker network create --d bridge --subnet=200.1.2.0/24 internal_net
docker run --privileged --network=internal_net --ip 200.1.2.5 -p 80:80 -t -d -i --name=Internal_WebServer webserver bash 
#docker exec Internal_WebServer service apache2 start --> already exists in dockerfile CMD

#FIREWALL
docker run --privileged  --network=external_net --ip 200.1.1.4 -td --name=firewall firewall bash
docker network connect --ip 200.1.2.4 internal_net firewall

#install connection
docker exec External_User route add default gw firewall
docker exec Web_server route add default gw firewall




