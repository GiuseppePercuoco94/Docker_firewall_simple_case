FROM ubuntu:latest

RUN apt-get update & apt-get install-y \
bridge-utils \
net-tools \
iptables

CMD echo "Firewalls UP!" && iptables -L