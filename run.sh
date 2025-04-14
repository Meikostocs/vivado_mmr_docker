#!/bin/bash

xhost +local:
sudo docker-compose up -d 
sudo docker exec -it vivado bash


