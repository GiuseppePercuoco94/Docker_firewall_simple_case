#!/bin/bash

docker build -t firewall .
docker run --privileged -t firewall 