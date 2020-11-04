FROM ubuntu:latest

RUN apt-get update & apt-get install-y \
bridge-utils \
net-tools \
apt-get install apache2 -y

CMD echo "WebServer UP!" && service apache2 start