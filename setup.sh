#!/bin/bash

mkdir vivado
mkdir installer


cat <<EOF >docker-compose.yaml

services:
  pc:
    build: 
      context: .
      args:
        SETUP_FILE: vivado2023_2.bin
    environment:
      - DISPLAY=${DISPLAY}
      - XAUTHORITY=/tmp/.docker.xauth
    ports:
      - "2227:22"
    volumes:
      - $(pwd)/vivado:/opt:rw
      - /tmp/.X11-unix:/tmp/.X11-unix:rw
      - /dev:/dev               
      - /run/udev:/run/udev          
      - ${XAUTHORITY:-/tmp/.docker.xauth}:/tmp/.docker.xauth
    privileged: true                 
    network_mode: "host"            
    ipc: host
    stdin_open: true
    tty: true
EOF

echo "[+] Generated docker-compose"
