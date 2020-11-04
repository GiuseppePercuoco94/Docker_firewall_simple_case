#!/bin/bash

docker build -t host_ubuntu .
docker run --privileged -t hust_ubuntu 